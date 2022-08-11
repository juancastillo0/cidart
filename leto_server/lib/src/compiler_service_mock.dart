import 'dart:async';
import 'dart:convert' show utf8;
import 'dart:io';
import 'dart:math' show Random;

import 'compiler_api_models.dart';
import 'compiler_models.dart';
import 'compiler_service.dart';

class CompilerServiceMock implements CompilerService {
  CompilerServiceMock(int seed, this.config) : random = Random(seed);

  final Random random;
  @override
  final ServiceConfig config;

  @override
  final Map<String, List<CompilerLog>> logs = {};

  @override
  CurrentExecutedService? currentService;

  @override
  List<CompilerLog> compilationLogs = [];

  @override
  bool starting = false;

  List<CompilerLog> _batchedLogs = [];
  final _streamController = StreamController<List<CompilerLog>>.broadcast();
  Timer? batchTimer;

  Stream<List<CompilerLog>> get stream {
    int prevLength = 0;
    return _streamController.stream.where((event) {
      final isDifferent = event.length != prevLength;
      if (isDifferent) {
        prevLength = event.length;
      }
      return isDifferent;
    });
  }

  void _log(
    String message, {
    DateTime? time,
    ProcessExecResult? result,
  }) {
    final item = CompilerLog(
      compilationLogs.length,
      message,
      time: time,
      result: result,
    );
    compilationLogs.add(item);
    _batchedLogs.add(item);

    batchTimer ??= Timer(const Duration(milliseconds: 400), () {
      _streamController.add(_batchedLogs);
      batchTimer = null;
      _batchedLogs = [];
    });
  }

  @override
  Future<List<CompilerLog>> startService() async {
    if (starting) return compilationLogs;
    starting = true;
    _log('starting');

    compilationLogs = [];
    await Future.delayed(Duration(seconds: 2));

    _executeAll().onError((error, stackTrace) {
      if (error is! ExecException) {
        _log('$error $stackTrace');
      }
      return null;
    }).then((_) {
      starting = false;
    });

    return compilationLogs;
  }

  Future<void> _executeAll() async {
    for (final c in config.commands) {
      final processed = processCliCommand(config, c);
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
    final commandStr = '"$executable ${arguments.join(' ')}"'
        '${context == null ? '' : '. context: $context'}';
    _log('exec: $commandStr');

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
      result: result,
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
