import 'package:json_annotation/json_annotation.dart';
import 'package:leto_schema/leto_schema.dart';
import 'package:valida/valida.dart';

import 'compiler_models.dart';
import 'filters.dart';

part 'compiler_api_models.g.dart';

const GIT_BRANCH_REGEXP =
    r'^(?!.*/\.)(?!.*\.\.)(?!/)(?!.*//)(?!.*@\{)(?!.*\\)[^\000-\037\177 ~^:?*[]+/[^\000-\037\177 ~^:?*[]+(?<!\.lock)(?<!/)(?<!\.)$';

@Valida()
@JsonSerializable()
@GraphQLInput()
class ServiceConfigInput {
  @ValidaString(
    matches: r'^https://github.com/([a-zA-Z0-9\-\_]+)/([a-zA-Z0-9\-\_]+)$',
    isUrl: true,
  )
  final String gitRepo;
  @ValidaString(matches: GIT_BRANCH_REGEXP)
  final String gitBranch;
  @ValidaString(
    matches: r'^[a-zA-Z0-9\_\.]([a-zA-Z0-9\-\_/\.]+)[a-zA-Z0-9]$',
  )
  final String serverFile;
  // TODO: this is not being taken into account in validation
  final List<CliCommandInput> commands;

  late final String id = [
    gitRepo,
    gitBranch,
    serverFile,
  ].map(Uri.encodeComponent).join('/');

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

@Valida()
@JsonSerializable()
@GraphQLInput()
class CliCommandInput {
  final String name;
  @ValidaString(
    // not white space
    matches: r'^([^\s]+.*[^\s]+|[^\s]{1})$',
  )
  final String command;
  @ValidaList(customValidate: CliCommandInput.validateVariables)
  final List<CliCommandVariable> variables;

  static List<ValidaError> validateVariables(
    List<CliCommandVariable> variables,
  ) {
    final Map<String, List<CliCommandVariable>> map = {};
    for (final v in variables) {
      map.putIfAbsent(v.key, () => []).add(v);
    }
    map.removeWhere((key, value) => value.length <= 1);
    return [
      if (map.isNotEmpty)
        ValidaError(
          errorCode: 'CliCommandInput.duplicateKey',
          message: map.entries
              .map((e) =>
                  'Found ${e.value.length} duplicate values for key "${e.key}":${e.value.map((e) => e.type.name).join(', ')}')
              .join('. '),
          property: 'variables',
          value: variables,
        ),
    ];
  }

  CliCommandInput({
    required this.name,
    required this.command,
    this.variables = const [],
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

  const ServiceConfig({
    required this.serviceId,
    required this.gitRepo,
    required this.gitBranch,
    required this.serverFile,
    required this.commands,
  });

  @GraphQLField(omit: true)
  Map<String, String> get dynamicVariables => {
        '\${serviceId}': serviceId,
        '\${gitRepo}': gitRepo,
        '\${gitBranch}': gitBranch,
        '\${serverFile}': serverFile,
      };

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
