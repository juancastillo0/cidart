import 'dart:async' show Timer, StreamController;
import 'dart:convert' show utf8;
import 'dart:io' show Process;

class ProcessExecEvent {
  final List<String>? stderr;
  final List<String>? stdout;
  final int? exitCode;

  ProcessExecEvent({
    this.stderr,
    this.stdout,
    this.exitCode,
  });

  static Stream<ProcessExecEvent> streamFromProcess(
    Process process, {
    Duration duration = const Duration(milliseconds: 300),
  }) {
    final controller = StreamController<ProcessExecEvent>();
    List<String>? stderr;
    List<String>? stdout;
    int? exitCode;
    bool listening = false;
    bool done = false;
    Timer? timer;

    void _sendEvent() {
      timer = null;
      if (exitCode == null && stderr == null && stdout == null ||
          (!listening && exitCode == null)) {
        return;
      }
      controller.add(ProcessExecEvent(
        stderr: stderr,
        stdout: stdout,
        exitCode: exitCode,
      ));
      stderr = null;
      stdout = null;
    }

    controller.onListen = () {
      listening = true;
      _sendEvent();
    };
    controller.onCancel = () {
      listening = false;
    };

    void _setUpTimer() {
      if (listening) {
        timer ??= Timer(duration, _sendEvent);
      }
    }

    void _onDone() async {
      if (done) return;
      done = true;
      timer?.cancel();
      exitCode = await process.exitCode;
      _sendEvent();
      await controller.close();
    }

    process.stderr.map(utf8.decode).listen((event) {
      (stderr ??= []).add(event);
      _setUpTimer();
    }, cancelOnError: true, onDone: _onDone);
    process.stdout.map(utf8.decode).listen((event) {
      (stdout ??= []).add(event);
      _setUpTimer();
    }, cancelOnError: true, onDone: _onDone);
    return controller.stream;
  }
}
