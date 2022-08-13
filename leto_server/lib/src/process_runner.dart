import 'dart:convert' show Encoding;
import 'dart:io' as io;
import 'dart:io' show ProcessStartMode;

enum CompilerPlatform {
  android,
  fuchsia,
  ios,
  linux,
  macos,
  windows,
}

abstract class ProcessRunner {
  CompilerPlatform get platform;

  Future<io.ProcessResult> run(
    ProcessRunArgs args, {
    Encoding? stdoutEncoding = io.systemEncoding,
    Encoding? stderrEncoding = io.systemEncoding,
  });

  Future<io.Process> start(
    ProcessRunArgs args, {
    ProcessStartMode mode = ProcessStartMode.normal,
  });
}

class ProcessRunArgs {
  final String executable;
  final List<String> arguments;
  final String? workingDirectory;
  final Map<String, String>? environment;
  final bool includeParentEnvironment;
  final bool runInShell;

  const ProcessRunArgs(
    this.executable,
    this.arguments, {
    this.workingDirectory,
    this.environment,
    this.includeParentEnvironment = true,
    this.runInShell = false,
  });
}

class ProcessRunnerIO implements ProcessRunner {
  const ProcessRunnerIO();

  @override
  CompilerPlatform get platform =>
      CompilerPlatform.values.byName(io.Platform.operatingSystem);

  @override
  Future<io.ProcessResult> run(
    ProcessRunArgs args, {
    Encoding? stdoutEncoding = io.systemEncoding,
    Encoding? stderrEncoding = io.systemEncoding,
  }) {
    return io.Process.run(
      args.executable,
      args.arguments,
      workingDirectory: args.workingDirectory,
      environment: args.environment,
      includeParentEnvironment: args.includeParentEnvironment,
      runInShell: args.runInShell,
      stdoutEncoding: stdoutEncoding,
      stderrEncoding: stderrEncoding,
    );
  }

  @override
  Future<io.Process> start(
    ProcessRunArgs args, {
    ProcessStartMode mode = ProcessStartMode.normal,
  }) {
    return io.Process.start(
      args.executable,
      args.arguments,
      workingDirectory: args.workingDirectory,
      environment: args.environment,
      includeParentEnvironment: args.includeParentEnvironment,
      runInShell: args.runInShell,
      mode: mode,
    );
  }
}
