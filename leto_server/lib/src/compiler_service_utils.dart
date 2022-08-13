import 'dart:io';

import 'compiler_models.dart';

List<String> processCliCommand(
  Map<String, String> dynamicVariables,
  CliCommand command,
) {
  if (command.variables.isEmpty) {
    return command.command;
  }
  final variables = command.variablesMap();
  final mapped = command.command
      .map(
        (value) => value.replaceAllMapped(
          RegExp('(${command.variables.map((e) => '\${${e.key}}').join('|')})'),
          (match) {
            final value = match.input.substring(match.start, match.end);
            final variable = variables[value]!;
            return getVariableValue(dynamicVariables, variable);
          },
        ),
      )
      .toList();
  return mapped;
}

String getVariableValue(
    Map<String, String> dynamicVariables, CliCommandVariable variable) {
  switch (variable.type) {
    case CliCommandVariableType.constant:
      return variable.value.split('=').skip(1).join('=');
    case CliCommandVariableType.execution:
      return dynamicVariables[variable.key]!;
    case CliCommandVariableType.environment:
      return Platform.environment[variable.key]!;
  }
}

class CurrentExecutedService {
  final String commitHash;
  final Process serverProcess;
  final String serverDirectory;

  CurrentExecutedService({
    required this.commitHash,
    required this.serverProcess,
    required this.serverDirectory,
  });
}

class CurrentCompilation {
  final String commitHash;
  final List<CompilationLog> compilationLogs;
  final CompilationStatus status;

  CurrentCompilation({
    required this.commitHash,
    required this.compilationLogs,
    required this.status,
  });

  CurrentCompilation copyWith({
    String? commitHash,
    List<CompilationLog>? compilationLogs,
    CompilationStatus? status,
  }) {
    return CurrentCompilation(
      commitHash: commitHash ?? this.commitHash,
      compilationLogs: compilationLogs ?? this.compilationLogs,
      status: status ?? this.status,
    );
  }
}

final ServiceConfig configDefault = ServiceConfig(
  gitRepo: 'https://github.com/juancastillo0/room_signals',
  gitBranch: 'main',
  serverFile: 'bin/server',
  serviceId: 'default',
  createdDate: DateTime.now(),
  commands: [
    CliCommand(
      name: '',
      command: 'dart pub get'.split(' '),
      modifiedDate: DateTime.now(),
      variables: [],
    ),
    CliCommand(
      name: '',
      command: 'dart analyze'.split(' '),
      modifiedDate: DateTime.now(),
      variables: [],
    ),
    CliCommand(
      name: '',
      command: 'dart test'.split(' '),
      modifiedDate: DateTime.now(),
      variables: [],
    ),
    CliCommand(
      name: '',
      command:
          'compile exe \${serverFile}.dart --output \${serverFile}'.split(' '),
      modifiedDate: DateTime.now(),
      variables: [
        CliCommandVariable(
          CliCommandVariableType.execution,
          'serverFile',
        ),
      ],
    ),
  ],
);
