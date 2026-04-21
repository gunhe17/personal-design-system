import 'dart:io';

class ClaudeResult {
  final int exitCode;
  final String stdout;
  final String stderr;

  ClaudeResult(this.exitCode, this.stdout, this.stderr);
}

Future<ClaudeResult> runClaude({
  required String projectRoot,
  required String prompt,
  required String systemPrompt,
  String claudeBinary = 'claude',
}) async {
  final args = [
    '-p',
    prompt,
    '--append-system-prompt',
    systemPrompt,
    '--permission-mode',
    'bypassPermissions',
  ];

  try {
    final result = await Process.run(
      claudeBinary,
      args,
      workingDirectory: projectRoot,
      runInShell: true,
    );
    return ClaudeResult(
      result.exitCode,
      (result.stdout ?? '').toString(),
      (result.stderr ?? '').toString(),
    );
  } on ProcessException catch (e) {
    return ClaudeResult(-1, '', 'Failed to run claude: ${e.message}');
  }
}

String buildSystemPrompt({required List<String> targetFiles}) {
  return '''
You are editing a Flutter design system repository.

Constraints:
- Edit ONLY these files (do not create, delete, or rename other files):
${targetFiles.map((f) => '  - $f').join('\n')}
- Preserve existing conventions: import paths, widget APIs, and tokens from lib/core/*
  (AppColors, AppTypography, AppDimensions, AppAnimations).
- Do not rename public exports or widget class names.
- Keep changes minimal. Do not refactor unrelated code.
- Do not add comments explaining what the code does.
- If the request cannot be fulfilled safely within the constraints, make no changes.
''';
}
