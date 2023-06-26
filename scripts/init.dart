import 'dart:io';

void main() {
  print('[init] Git hook 설치...');
  _runCommand('git', ['config', '--local', 'core.hooksPath', 'hooks']);
  print('[init] 의존성 설치...');
  _runCommand('flutter', ['pub', 'get']);
  print('[init] assets.dart 생성...');
  _generateAssetsClass();
  print('[init] Done!');
}

ProcessResult _runCommand(String executable, List<String> arguments) {
  final result = Process.runSync(executable, arguments, runInShell: true);
  print(result.stdout);
  print(result.stderr);

  if (result.exitCode != 0) {
    throw '[init] Failed to run the command!';
  }

  return result;
}

void _generateAssetsClass() {
  final assetPathEntities = Directory('assets/images').listSync();
  final List<String> memberLines = [];

  for (final pathEntity in assetPathEntities) {
    final path = pathEntity.path.replaceAll(RegExp(r'\\+'), '/');
    final variableName =
        _removeExtension(_underscoreToCamelcase(_getNameFromPath(path)));
    memberLines.add("static const String $variableName = '$path';");
  }

  final code = '''class Assets {
${memberLines.map((line) => '  $line').join('\n')}
}
''';

  File('lib/common/assets.dart').writeAsStringSync(code);
  print('Done!');
}

String _removeExtension(String value) {
  return value.replaceAll(RegExp(r'\.[a-zA-Z]+$'), '');
}

String _underscoreToCamelcase(String value) {
  return value.replaceAllMapped(
    RegExp(r'_[a-zA-Z]'),
    (match) => (match[0] ?? '  ')[1].toUpperCase(),
  );
}

String _getNameFromPath(String path) {
  return File(path).uri.pathSegments.last;
}
