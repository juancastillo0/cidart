import 'package:leto_schema/leto_schema.dart';

import 'compiler_models.dart';

part 'compilation_event.g.dart';

@GraphQLUnion()
class CompilationEvent {
  factory CompilationEvent.created(ServiceConfig service) =
      _CompilationEventCreated;
  factory CompilationEvent.currentCompilation(Compilation compilation) =
      _CompilationEventCompilation;
  factory CompilationEvent.creationError(String message) =
      _CompilationEventCreationError;

  factory CompilationEvent.log(CompilationLog log) = _CompilationEventLog;
  factory CompilationEvent.execution(CommandExecution command, int logIndex) =
      _CompilationEventExecution;
  factory CompilationEvent.partialExecution({
    required List<String> stderr,
    required List<String> stdout,
  }) = _CompilationEventPartialExecution;
}

@GraphQLObject()
class _CompilationEventCreated implements CompilationEvent {
  final ServiceConfig service;

  _CompilationEventCreated(this.service);
}

@GraphQLObject()
class _CompilationEventCompilation implements CompilationEvent {
  final Compilation compilation;

  _CompilationEventCompilation(this.compilation);
}

@GraphQLObject()
class _CompilationEventLog implements CompilationEvent {
  final CompilationLog log;

  _CompilationEventLog(this.log);
}

@GraphQLObject()
class _CompilationEventExecution implements CompilationEvent {
  final CommandExecution command;
  final int logIndex;

  _CompilationEventExecution(this.command, this.logIndex);
}

@GraphQLObject()
class _CompilationEventPartialExecution implements CompilationEvent {
  final List<String> stderr;
  final List<String> stdout;

  _CompilationEventPartialExecution({
    required this.stdout,
    required this.stderr,
  });
}

@GraphQLObject()
class _CompilationEventCreationError implements CompilationEvent {
  final String message;

  _CompilationEventCreationError(this.message);
}
