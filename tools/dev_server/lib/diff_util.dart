import 'dart:io';
import 'package:path/path.dart' as p;

/// Returns the subset of [targetFiles] whose current content differs from the
/// pre-run snapshot at [beforeDir]. Only these paths are attributed to this
/// /edit call; unrelated uncommitted changes elsewhere in the repo are ignored.
List<String> detectModifiedTargets({
  required String projectRoot,
  required String beforeDir,
  required List<String> targetFiles,
}) {
  final modified = <String>[];
  for (final rel in targetFiles) {
    final before = File(p.join(beforeDir, rel));
    final after = File(p.join(projectRoot, rel));
    final beforeContent = before.existsSync() ? before.readAsStringSync() : null;
    final afterContent = after.existsSync() ? after.readAsStringSync() : null;
    if (beforeContent != afterContent) {
      modified.add(rel);
    }
  }
  return modified;
}

Future<String> unifiedDiffViaGit({
  required String projectRoot,
  required List<String> paths,
}) async {
  if (paths.isEmpty) return '';
  try {
    final result = await Process.run(
      'git',
      ['--no-pager', 'diff', '--no-color', '--no-ext-diff', '--', ...paths],
      workingDirectory: projectRoot,
    );
    if (result.exitCode != 0) return '';
    return result.stdout as String;
  } catch (_) {
    return '';
  }
}

String fallbackDiff({
  required String projectRoot,
  required String beforeDir,
  required List<String> paths,
}) {
  final buf = StringBuffer();
  for (final rel in paths) {
    final afterFile = File(p.join(projectRoot, rel));
    final beforeFile = File(p.join(beforeDir, rel));
    final after = afterFile.existsSync() ? afterFile.readAsStringSync() : '';
    final before = beforeFile.existsSync() ? beforeFile.readAsStringSync() : '';
    if (before == after) continue;
    buf.writeln('--- a/$rel');
    buf.writeln('+++ b/$rel');
    final beforeLines = before.split('\n');
    final afterLines = after.split('\n');
    for (final l in beforeLines) {
      buf.writeln('-$l');
    }
    for (final l in afterLines) {
      buf.writeln('+$l');
    }
  }
  return buf.toString();
}
