import 'dart:io';

void main() {
  print('[init] Installing Git hooks...');
  _runCommand('git', ['config', '--local', 'core.hooksPath', 'hooks']);
  print('[init] Installing the dependencies...');
  _runCommand('flutter', ['pub', 'get']);
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
