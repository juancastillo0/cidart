import 'package:json_annotation/json_annotation.dart';
import 'package:leto_schema/leto_schema.dart';
import 'package:valida/valida.dart';

import 'compiler_models.dart';
import 'filters.dart';

part 'compiler_api_models.g.dart';

@JsonSerializable()
@GraphQLInput()
class ServiceConfigInput {
  final String gitRepo;
  final String gitBranch;
  final String serverFile;
  final List<CliCommandInput> commands;

  ServiceConfigInput({
    required this.gitRepo,
    required this.gitBranch,
    required this.serverFile,
    required this.commands,
  });

  factory ServiceConfigInput.fromJson(Map<String, Object?> json) =>
      _$ServiceConfigInputFromJson(json);
  Map<String, Object?> toJson() => _$ServiceConfigInputToJson(this);
}

@JsonSerializable()
@GraphQLInput()
class CliCommandInput {
  final String name;
  final String command;
  final List<CliCommandVariable> variables;

  CliCommandInput({
    required this.name,
    required this.command,
    required this.variables,
  });

  factory CliCommandInput.fromJson(Map<String, Object?> json) =>
      _$CliCommandInputFromJson(json);
  Map<String, Object?> toJson() => _$CliCommandInputToJson(this);
}

@JsonSerializable()
@GraphQLClass()
class ServiceConfig {
  final String serviceId;
  final String gitRepo;
  final String gitBranch;
  final String serverFile;
  // TODO: List<CliCommandInput> commands was not thorowing
  final List<CliCommand> commands;

  ServiceConfig({
    required this.serviceId,
    required this.gitRepo,
    required this.gitBranch,
    required this.serverFile,
    required this.commands,
  });

  factory ServiceConfig.fromJson(Map<String, Object?> json) =>
      _$ServiceConfigFromJson(json);
  Map<String, Object?> toJson() => _$ServiceConfigToJson(this);
}

@Valida()
@JsonSerializable()
@GraphQLInput()
class CompilationFilter with Matcher<Compilation> {
  final StringFilter? gitRepo;
  final StringFilter? gitBranch;
  final StringFilter? serverFile;
  final StringFilter? commitHash;
  final List<CompilationStatus>? statusIsIn;
  final DateTimeFilter? startTime;
  final DateTimeFilter? endTime;

  CompilationFilter({
    required this.gitRepo,
    required this.gitBranch,
    required this.serverFile,
    required this.commitHash,
    required this.statusIsIn,
    required this.startTime,
    this.endTime,
  });

  @override
  bool hasMatch(Compilation value) {
    if (gitRepo != null && !gitRepo!.hasMatch(value.gitRepo)) {
      return false;
    } else if (gitBranch != null && !gitBranch!.hasMatch(value.gitBranch)) {
      return false;
    } else if (serverFile != null && !serverFile!.hasMatch(value.serverFile)) {
      return false;
    } else if (commitHash != null && !commitHash!.hasMatch(value.commitHash)) {
      return false;
    } else if (statusIsIn != null && !statusIsIn!.contains(value.status)) {
      return false;
    } else if (startTime != null && !startTime!.hasMatch(value.startTime)) {
      return false;
    } else if (endTime != null &&
        ((value.endTime == null && endTime!.isInTheFuture()) ||
            value.endTime != null && !endTime!.hasMatch(value.endTime!))) {
      return false;
    }
    return true;
  }

  factory CompilationFilter.fromJson(Map<String, Object?> json) =>
      _$CompilationFilterFromJson(json);
  Map<String, Object?> toJson() => _$CompilationFilterToJson(this);
}
