import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

import 'package:flutter_design_system_dev_server/claude_runner.dart';
import 'package:flutter_design_system_dev_server/diff_util.dart';
import 'package:flutter_design_system_dev_server/paths.dart';
import 'package:flutter_design_system_dev_server/version_store.dart';

const int port = 7891;

Future<void> main() async {
  final projectRoot = findProjectRoot();
  final store = VersionStore(projectRoot);

  stdout.writeln('[dev_server] project root: $projectRoot');
  stdout.writeln('[dev_server] versions dir: ${versionsRoot(projectRoot)}');

  final router = Router()
    ..get('/health', (Request req) => _json({'ok': true, 'projectRoot': projectRoot}))
    ..post('/edit', (Request req) => _handleEdit(req, projectRoot, store))
    ..get('/history', (Request req) => _handleHistory(req, store))
    ..post('/rollback', (Request req) => _handleRollback(req, projectRoot, store));

  final handler = const Pipeline()
      .addMiddleware(_cors())
      .addHandler(router.call);

  final server = await io.serve(handler, InternetAddress.loopbackIPv4, port);
  stdout.writeln('[dev_server] listening on http://${server.address.host}:${server.port}');
}

Middleware _cors() {
  return (Handler inner) {
    return (Request req) async {
      if (req.method == 'OPTIONS') {
        return Response.ok('', headers: _corsHeaders(req));
      }
      final resp = await inner(req);
      return resp.change(headers: {...resp.headers, ..._corsHeaders(req)});
    };
  };
}

Map<String, String> _corsHeaders(Request req) {
  final origin = req.headers['origin'];
  String allow = 'http://localhost';
  if (origin != null && (origin.startsWith('http://localhost') || origin.startsWith('http://127.0.0.1'))) {
    allow = origin;
  }
  return {
    'Access-Control-Allow-Origin': allow,
    'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
    'Access-Control-Allow-Headers': 'Content-Type',
    'Vary': 'Origin',
  };
}

Response _json(Object? body, {int status = 200}) {
  return Response(
    status,
    body: jsonEncode(body),
    headers: {'content-type': 'application/json; charset=utf-8'},
  );
}

Response _error(String message, {int status = 400}) => _json({'error': message}, status: status);

Future<Response> _handleEdit(Request req, String projectRoot, VersionStore store) async {
  Map<String, dynamic> body;
  try {
    body = jsonDecode(await req.readAsString()) as Map<String, dynamic>;
  } catch (e) {
    return _error('Invalid JSON body');
  }

  final unitId = body['unitId'] as String?;
  final targetFilesRaw = (body['targetFiles'] as List?)?.cast<String>();
  final prompt = (body['prompt'] as String?)?.trim();
  if (unitId == null || unitId.isEmpty) return _error('Missing unitId');
  if (targetFilesRaw == null || targetFilesRaw.isEmpty) return _error('Missing targetFiles');
  if (prompt == null || prompt.isEmpty) return _error('Missing prompt');

  final targetFiles = <String>[];
  for (final t in targetFilesRaw) {
    try {
      resolveTarget(projectRoot, t); // validates
      targetFiles.add(t);
    } on FormatException catch (e) {
      return _error(e.message);
    }
  }

  final bucket = store.createBucket(unitId);

  store.snapshot(
    versionDir: bucket.dir,
    subdir: 'before',
    relativePaths: targetFiles,
  );

  final systemPrompt = buildSystemPrompt(targetFiles: targetFiles);
  final result = await runClaude(
    projectRoot: projectRoot,
    prompt: prompt,
    systemPrompt: systemPrompt,
  );

  final effectiveModified = detectModifiedTargets(
    projectRoot: projectRoot,
    beforeDir: '${bucket.dir}/before',
    targetFiles: targetFiles,
  );

  final diff = effectiveModified.isEmpty
      ? ''
      : await unifiedDiffViaGit(
          projectRoot: projectRoot,
          paths: effectiveModified,
        );
  final finalDiff = diff.isNotEmpty
      ? diff
      : fallbackDiff(
          projectRoot: projectRoot,
          beforeDir: '${bucket.dir}/before',
          paths: effectiveModified,
        );

  store.snapshot(
    versionDir: bucket.dir,
    subdir: 'after',
    relativePaths: effectiveModified,
  );

  final meta = VersionMeta(
    versionId: bucket.versionId,
    unitId: unitId,
    timestamp: DateTime.now(),
    prompt: prompt,
    targetFiles: targetFiles,
    modifiedFiles: effectiveModified,
    diff: finalDiff,
    claudeExitCode: result.exitCode,
    claudeOutput: result.stdout.isNotEmpty ? result.stdout : result.stderr,
    isRollback: false,
  );
  store.writeMeta(bucket.dir, meta);

  return _json({
    'versionId': bucket.versionId,
    'modifiedFiles': effectiveModified,
    'diff': finalDiff,
    'claudeExitCode': result.exitCode,
    'claudeOutput': meta.claudeOutput,
  });
}

Response _handleHistory(Request req, VersionStore store) {
  final unitId = req.url.queryParameters['unitId'];
  if (unitId == null || unitId.isEmpty) return _error('Missing unitId');
  final versions = store.list(unitId).map((m) => m.toJson()).toList();
  return _json({'versions': versions});
}

Future<Response> _handleRollback(Request req, String projectRoot, VersionStore store) async {
  Map<String, dynamic> body;
  try {
    body = jsonDecode(await req.readAsString()) as Map<String, dynamic>;
  } catch (e) {
    return _error('Invalid JSON body');
  }
  final unitId = body['unitId'] as String?;
  final versionId = body['versionId'] as String?;
  if (unitId == null || versionId == null) return _error('Missing unitId or versionId');

  final found = store.find(unitId, versionId);
  if (found == null) return _error('Version not found', status: 404);

  // Record a new bucket BEFORE rollback so we capture the current state.
  final bucket = store.createBucket(unitId);
  final filesToRestore = found.meta.modifiedFiles.isNotEmpty
      ? found.meta.modifiedFiles
      : found.meta.targetFiles;

  // Before the rollback, snapshot the current state.
  store.snapshot(
    versionDir: bucket.dir,
    subdir: 'before',
    relativePaths: filesToRestore,
  );

  final restored = store.restoreBefore(
    versionDir: found.dir,
    relativePaths: filesToRestore,
  );

  // After snapshot (current files now equal restored 'before').
  store.snapshot(
    versionDir: bucket.dir,
    subdir: 'after',
    relativePaths: restored,
  );

  final diff = await unifiedDiffViaGit(projectRoot: projectRoot, paths: restored);

  final meta = VersionMeta(
    versionId: bucket.versionId,
    unitId: unitId,
    timestamp: DateTime.now(),
    prompt: 'Rollback to $versionId',
    targetFiles: found.meta.targetFiles,
    modifiedFiles: restored,
    diff: diff,
    claudeExitCode: 0,
    isRollback: true,
    rollbackOf: versionId,
  );
  store.writeMeta(bucket.dir, meta);

  return _json({
    'versionId': bucket.versionId,
    'modifiedFiles': restored,
    'diff': diff,
    'claudeExitCode': 0,
    'rollbackOf': versionId,
  });
}
