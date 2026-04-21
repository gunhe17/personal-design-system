import 'dart:io';
import 'package:path/path.dart' as p;

/// Project root is the folder that contains the Flutter `pubspec.yaml`.
/// Server is launched via `dart run tools/dev_server/bin/server.dart`, so
/// walking up from the script location locates it reliably.
String findProjectRoot() {
  var dir = Directory.current.absolute;
  while (true) {
    final pubspec = File(p.join(dir.path, 'pubspec.yaml'));
    if (pubspec.existsSync()) {
      final content = pubspec.readAsStringSync();
      if (content.contains('flutter:\n    sdk: flutter') ||
          content.contains('sdk: flutter')) {
        return dir.path;
      }
    }
    final parent = dir.parent;
    if (parent.path == dir.path) {
      throw StateError('Could not locate Flutter project root (pubspec.yaml with Flutter SDK).');
    }
    dir = parent;
  }
}

String versionsRoot(String projectRoot) => p.join(projectRoot, '.versions');

/// Returns an absolute, normalized path for `target` relative to project root,
/// and throws if it escapes the allowed roots under `lib/`.
String resolveTarget(String projectRoot, String target) {
  final normalized = p.normalize(target);
  if (p.isAbsolute(normalized)) {
    throw FormatException('Target must be a repo-relative path: $target');
  }
  if (normalized.contains('..')) {
    throw FormatException('Target must not contain ..: $target');
  }
  if (!normalized.startsWith('lib${p.separator}') && normalized != 'lib') {
    throw FormatException('Target must be under lib/: $target');
  }
  return p.join(projectRoot, normalized);
}
