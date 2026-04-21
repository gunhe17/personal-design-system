import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class EditResult {
  final String versionId;
  final String diff;
  final List<String> modifiedFiles;
  final int claudeExitCode;
  final String? claudeOutput;

  const EditResult({
    required this.versionId,
    required this.diff,
    required this.modifiedFiles,
    required this.claudeExitCode,
    this.claudeOutput,
  });

  factory EditResult.fromJson(Map<String, dynamic> json) => EditResult(
        versionId: json['versionId'] as String,
        diff: (json['diff'] as String?) ?? '',
        modifiedFiles: (json['modifiedFiles'] as List?)?.cast<String>() ?? const [],
        claudeExitCode: (json['claudeExitCode'] as num?)?.toInt() ?? 0,
        claudeOutput: json['claudeOutput'] as String?,
      );
}

class VersionEntry {
  final String versionId;
  final String unitId;
  final DateTime timestamp;
  final String prompt;
  final List<String> targetFiles;
  final List<String> modifiedFiles;
  final bool isRollback;
  final String? rollbackOf;

  const VersionEntry({
    required this.versionId,
    required this.unitId,
    required this.timestamp,
    required this.prompt,
    required this.targetFiles,
    required this.modifiedFiles,
    required this.isRollback,
    this.rollbackOf,
  });

  factory VersionEntry.fromJson(Map<String, dynamic> json) => VersionEntry(
        versionId: json['versionId'] as String,
        unitId: json['unitId'] as String,
        timestamp: DateTime.parse(json['timestamp'] as String),
        prompt: (json['prompt'] as String?) ?? '',
        targetFiles: (json['targetFiles'] as List?)?.cast<String>() ?? const [],
        modifiedFiles: (json['modifiedFiles'] as List?)?.cast<String>() ?? const [],
        isRollback: (json['isRollback'] as bool?) ?? false,
        rollbackOf: json['rollbackOf'] as String?,
      );
}

class DevEditService {
  static const String defaultBaseUrl = 'http://127.0.0.1:7891';

  final String baseUrl;
  final http.Client _client;

  DevEditService({String? baseUrl, http.Client? client})
      : baseUrl = baseUrl ?? defaultBaseUrl,
        _client = client ?? http.Client();

  bool get enabled => kDebugMode;

  Future<EditResult> sendEdit({
    required String unitId,
    required List<String> targetFiles,
    required String prompt,
  }) async {
    if (!enabled) {
      throw StateError('DevEditService is only available in debug builds.');
    }
    final resp = await _client.post(
      Uri.parse('$baseUrl/edit'),
      headers: const {'Content-Type': 'application/json'},
      body: jsonEncode({
        'unitId': unitId,
        'targetFiles': targetFiles,
        'prompt': prompt,
      }),
    );
    _ensureOk(resp, 'sendEdit');
    return EditResult.fromJson(jsonDecode(resp.body) as Map<String, dynamic>);
  }

  Future<List<VersionEntry>> fetchHistory(String unitId) async {
    if (!enabled) return const [];
    final resp = await _client.get(Uri.parse('$baseUrl/history?unitId=${Uri.encodeQueryComponent(unitId)}'));
    _ensureOk(resp, 'fetchHistory');
    final body = jsonDecode(resp.body) as Map<String, dynamic>;
    final versions = (body['versions'] as List?) ?? const [];
    return versions
        .map((e) => VersionEntry.fromJson(e as Map<String, dynamic>))
        .toList(growable: false);
  }

  Future<EditResult> rollback({
    required String unitId,
    required String versionId,
  }) async {
    if (!enabled) {
      throw StateError('DevEditService is only available in debug builds.');
    }
    final resp = await _client.post(
      Uri.parse('$baseUrl/rollback'),
      headers: const {'Content-Type': 'application/json'},
      body: jsonEncode({'unitId': unitId, 'versionId': versionId}),
    );
    _ensureOk(resp, 'rollback');
    return EditResult.fromJson(jsonDecode(resp.body) as Map<String, dynamic>);
  }

  void _ensureOk(http.Response resp, String op) {
    if (resp.statusCode >= 200 && resp.statusCode < 300) return;
    String message = resp.body;
    try {
      final decoded = jsonDecode(resp.body);
      if (decoded is Map && decoded['error'] is String) {
        message = decoded['error'] as String;
      }
    } catch (_) {}
    throw DevEditException('$op failed (${resp.statusCode}): $message');
  }
}

class DevEditException implements Exception {
  final String message;
  DevEditException(this.message);
  @override
  String toString() => message;
}
