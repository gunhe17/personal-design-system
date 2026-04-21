import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as p;

import 'paths.dart';

class VersionMeta {
  final String versionId;
  final String unitId;
  final DateTime timestamp;
  final String prompt;
  final List<String> targetFiles;
  final List<String> modifiedFiles;
  final String diff;
  final int claudeExitCode;
  final String? claudeOutput;
  final bool isRollback;
  final String? rollbackOf;

  VersionMeta({
    required this.versionId,
    required this.unitId,
    required this.timestamp,
    required this.prompt,
    required this.targetFiles,
    required this.modifiedFiles,
    required this.diff,
    required this.claudeExitCode,
    this.claudeOutput,
    required this.isRollback,
    this.rollbackOf,
  });

  Map<String, dynamic> toJson() => {
        'versionId': versionId,
        'unitId': unitId,
        'timestamp': timestamp.toUtc().toIso8601String(),
        'prompt': prompt,
        'targetFiles': targetFiles,
        'modifiedFiles': modifiedFiles,
        'diff': diff,
        'claudeExitCode': claudeExitCode,
        'claudeOutput': claudeOutput,
        'isRollback': isRollback,
        'rollbackOf': rollbackOf,
      };

  factory VersionMeta.fromJson(Map<String, dynamic> json) => VersionMeta(
        versionId: json['versionId'] as String,
        unitId: json['unitId'] as String,
        timestamp: DateTime.parse(json['timestamp'] as String),
        prompt: (json['prompt'] as String?) ?? '',
        targetFiles: (json['targetFiles'] as List?)?.cast<String>() ?? const [],
        modifiedFiles: (json['modifiedFiles'] as List?)?.cast<String>() ?? const [],
        diff: (json['diff'] as String?) ?? '',
        claudeExitCode: (json['claudeExitCode'] as num?)?.toInt() ?? 0,
        claudeOutput: json['claudeOutput'] as String?,
        isRollback: (json['isRollback'] as bool?) ?? false,
        rollbackOf: json['rollbackOf'] as String?,
      );
}

class VersionStore {
  final String projectRoot;

  VersionStore(this.projectRoot);

  String get _root => versionsRoot(projectRoot);

  /// Creates a new version bucket and returns (versionId, absolute version dir).
  ({String versionId, String dir}) createBucket(String unitId) {
    final now = DateTime.now();
    final id = _idFor(now);
    final unitDir = p.join(_root, _sanitize(unitId));
    final versionDir = p.join(unitDir, id);
    Directory(p.join(versionDir, 'before')).createSync(recursive: true);
    Directory(p.join(versionDir, 'after')).createSync(recursive: true);
    return (versionId: id, dir: versionDir);
  }

  void snapshot({
    required String versionDir,
    required String subdir, // 'before' or 'after'
    required List<String> relativePaths,
  }) {
    for (final rel in relativePaths) {
      final src = File(p.join(projectRoot, rel));
      if (!src.existsSync()) continue;
      final dst = File(p.join(versionDir, subdir, rel));
      dst.parent.createSync(recursive: true);
      src.copySync(dst.path);
    }
  }

  void writeMeta(String versionDir, VersionMeta meta) {
    final f = File(p.join(versionDir, 'meta.json'));
    f.writeAsStringSync(const JsonEncoder.withIndent('  ').convert(meta.toJson()));
  }

  List<VersionMeta> list(String unitId) {
    final dir = Directory(p.join(_root, _sanitize(unitId)));
    if (!dir.existsSync()) return const [];
    final metas = <VersionMeta>[];
    for (final entry in dir.listSync()) {
      if (entry is! Directory) continue;
      final metaFile = File(p.join(entry.path, 'meta.json'));
      if (!metaFile.existsSync()) continue;
      try {
        final decoded = jsonDecode(metaFile.readAsStringSync()) as Map<String, dynamic>;
        metas.add(VersionMeta.fromJson(decoded));
      } catch (_) {
        // skip malformed
      }
    }
    metas.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    return metas;
  }

  ({VersionMeta meta, String dir})? find(String unitId, String versionId) {
    final dir = p.join(_root, _sanitize(unitId), versionId);
    final metaFile = File(p.join(dir, 'meta.json'));
    if (!metaFile.existsSync()) return null;
    final decoded = jsonDecode(metaFile.readAsStringSync()) as Map<String, dynamic>;
    return (meta: VersionMeta.fromJson(decoded), dir: dir);
  }

  /// Restores files from `<versionDir>/before/<relative>` into the working tree.
  /// Returns the list of files that were actually restored.
  List<String> restoreBefore({
    required String versionDir,
    required List<String> relativePaths,
  }) {
    final restored = <String>[];
    for (final rel in relativePaths) {
      final src = File(p.join(versionDir, 'before', rel));
      if (!src.existsSync()) continue;
      final dst = File(p.join(projectRoot, rel));
      dst.parent.createSync(recursive: true);
      src.copySync(dst.path);
      restored.add(rel);
    }
    return restored;
  }

  String _idFor(DateTime t) {
    final u = t.toUtc();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${u.year}-${two(u.month)}-${two(u.day)}T${two(u.hour)}-${two(u.minute)}-${two(u.second)}-${u.millisecond.toString().padLeft(3, '0')}';
  }

  String _sanitize(String unitId) => unitId.replaceAll(RegExp(r'[^A-Za-z0-9._-]'), '_');
}
