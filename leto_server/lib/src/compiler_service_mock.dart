import 'dart:async';
import 'dart:math' show Random;

import 'package:leto_server/src/util.dart';

import 'compilation_event.dart';
import 'compiler_models.dart';
import 'compiler_service.dart';

class CompilerServiceMock implements CompilerService {
  CompilerServiceMock(Random? random, this.config)
      : random = random ?? Random();

  final Random random;
  @override
  final ServiceConfig config;

  @override
  final Map<String, CurrentCompilation> logs = {};

  @override
  CurrentExecutedService? currentService;

  @override
  CurrentCompilation? currentCompilation;

  List<CompilationLog> get _compilationLogs =>
      currentCompilation!.compilationLogs;

  @override
  bool starting = false;

  List<CompilationLog> _batchedLogs = [];
  final _streamController = StreamController<CompilationEvent>.broadcast();
  Timer? batchTimer;

  @override
  Stream<CompilationEvent> get stream => _streamController.stream;

  void _log(
    String message, {
    DateTime? time,
    CommandExecution? execution,
  }) {
    final item = CompilationLog(
      id: _compilationLogs.length,
      message: message,
      time: time ?? DateTime.now(),
      command: execution,
    );
    _compilationLogs.add(item);
    _batchedLogs.add(item);

    batchTimer ??= Timer(const Duration(milliseconds: 400), () {
      _batchedLogs.map(CompilationEvent.log).forEach(_streamController.add);
      batchTimer = null;
      _batchedLogs = [];
    });
  }

  @override
  Future<List<CompilationLog>> startService() async {
    if (starting) return _compilationLogs;
    starting = true;
    currentCompilation = CurrentCompilation(
      commitHash: randomId(random: random),
      compilationLogs: [],
      status: CompilationStatus.started,
    );
    _log('starting');

    await Future.delayed(Duration(seconds: 2));

    _executeAll().then((value) {
      currentCompilation =
          currentCompilation!.copyWith(status: CompilationStatus.success);
    }).onError((error, stackTrace) {
      currentCompilation =
          currentCompilation!.copyWith(status: CompilationStatus.error);
      if (error is! ExecException) {
        _log('$error $stackTrace');
      }
      return null;
    }).then((_) {
      starting = false;
    });

    return _compilationLogs;
  }

  Future<void> _executeAll() async {
    for (final c in config.commands) {
      final processed = processCliCommand(config.dynamicVariables, c);
      await _exec(
        processed.first,
        processed.sublist(1),
        context: c.toString(),
      );
    }
  }

  @override
  Future<String?> topOutput() async {
    await Future.delayed(Duration(seconds: 2));
    return random.nextBool() ? 'topOutput' : null;
  }

  Future<String> _exec(
    String executable,
    List<String> arguments, {
    String? context,
  }) async {
    final start = DateTime.now();
    final commandStr = '"$executable ${arguments.join(' ')}"'
        '${context == null ? '' : '. context: $context'}';
    _log('exec: $commandStr', time: start);

    final watch = Stopwatch()..start();
    await Future.delayed(const Duration(seconds: 1));

    final rand = random.nextDouble();
    final ProcessExecResult result;
    if (rand < 0.8) {
      result = ProcessExecResult(
        exitCode: 0,
        pid: random.nextInt(10000) + 1,
        stderr: '',
        stdout: 'stdout',
      );
    } else {
      result = ProcessExecResult(
        exitCode: random.nextInt(100) + 1,
        pid: random.nextInt(10000) + 1,
        stderr: 'stderr',
        stdout: '',
      );
    }
    final elapsed = watch.elapsed;
    _log(
      'exec: $commandStr. Duration:${elapsed.inMilliseconds}ms.',
      execution: CommandExecution(
        command: configDefault
            .commands[random.nextInt(configDefault.commands.length)],
        durationMs: elapsed.inMilliseconds,
        endTime: start.add(elapsed),
        status: CompilationStatus.fromStatusCode(result.exitCode),
        result: result,
      ),
    );
    if (result.exitCode != 0) {
      throw ExecException(
        result: result,
        context: context,
      );
    }
    return result.stdout;
  }
}
