import 'package:json_annotation/json_annotation.dart';
part 'schema.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Input$ServiceConfigInput {
  Input$ServiceConfigInput(
      {required this.gitRepo,
      required this.gitBranch,
      required this.serverFile,
      required this.commands});

  @override
  factory Input$ServiceConfigInput.fromJson(Map<String, dynamic> json) =>
      _$Input$ServiceConfigInputFromJson(json);

  final String gitRepo;

  final String gitBranch;

  final String serverFile;

  final List<Input$CliCommandInput> commands;

  Map<String, dynamic> toJson() => _$Input$ServiceConfigInputToJson(this);
  int get hashCode {
    final l$gitRepo = gitRepo;
    final l$gitBranch = gitBranch;
    final l$serverFile = serverFile;
    final l$commands = commands;
    return Object.hashAll([
      l$gitRepo,
      l$gitBranch,
      l$serverFile,
      Object.hashAll(l$commands.map((v) => v))
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$ServiceConfigInput) ||
        runtimeType != other.runtimeType) return false;
    final l$gitRepo = gitRepo;
    final lOther$gitRepo = other.gitRepo;
    if (l$gitRepo != lOther$gitRepo) return false;
    final l$gitBranch = gitBranch;
    final lOther$gitBranch = other.gitBranch;
    if (l$gitBranch != lOther$gitBranch) return false;
    final l$serverFile = serverFile;
    final lOther$serverFile = other.serverFile;
    if (l$serverFile != lOther$serverFile) return false;
    final l$commands = commands;
    final lOther$commands = other.commands;
    if (l$commands.length != lOther$commands.length) return false;
    for (int i = 0; i < l$commands.length; i++) {
      final l$commands$entry = l$commands[i];
      final lOther$commands$entry = lOther$commands[i];
      if (l$commands$entry != lOther$commands$entry) return false;
    }

    return true;
  }

  CopyWith$Input$ServiceConfigInput<Input$ServiceConfigInput> get copyWith =>
      CopyWith$Input$ServiceConfigInput(this, (i) => i);
}

abstract class CopyWith$Input$ServiceConfigInput<TRes> {
  factory CopyWith$Input$ServiceConfigInput(Input$ServiceConfigInput instance,
          TRes Function(Input$ServiceConfigInput) then) =
      _CopyWithImpl$Input$ServiceConfigInput;

  factory CopyWith$Input$ServiceConfigInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ServiceConfigInput;

  TRes call(
      {String? gitRepo,
      String? gitBranch,
      String? serverFile,
      List<Input$CliCommandInput>? commands});
  TRes commands(
      Iterable<Input$CliCommandInput> Function(
              Iterable<CopyWith$Input$CliCommandInput<Input$CliCommandInput>>)
          _fn);
}

class _CopyWithImpl$Input$ServiceConfigInput<TRes>
    implements CopyWith$Input$ServiceConfigInput<TRes> {
  _CopyWithImpl$Input$ServiceConfigInput(this._instance, this._then);

  final Input$ServiceConfigInput _instance;

  final TRes Function(Input$ServiceConfigInput) _then;

  static const _undefined = {};

  TRes call(
          {Object? gitRepo = _undefined,
          Object? gitBranch = _undefined,
          Object? serverFile = _undefined,
          Object? commands = _undefined}) =>
      _then(Input$ServiceConfigInput(
          gitRepo: gitRepo == _undefined || gitRepo == null
              ? _instance.gitRepo
              : (gitRepo as String),
          gitBranch: gitBranch == _undefined || gitBranch == null
              ? _instance.gitBranch
              : (gitBranch as String),
          serverFile: serverFile == _undefined || serverFile == null
              ? _instance.serverFile
              : (serverFile as String),
          commands: commands == _undefined || commands == null
              ? _instance.commands
              : (commands as List<Input$CliCommandInput>)));
  TRes commands(
          Iterable<Input$CliCommandInput> Function(
                  Iterable<
                      CopyWith$Input$CliCommandInput<Input$CliCommandInput>>)
              _fn) =>
      call(
          commands: _fn(_instance.commands
                  .map((e) => CopyWith$Input$CliCommandInput(e, (i) => i)))
              .toList());
}

class _CopyWithStubImpl$Input$ServiceConfigInput<TRes>
    implements CopyWith$Input$ServiceConfigInput<TRes> {
  _CopyWithStubImpl$Input$ServiceConfigInput(this._res);

  TRes _res;

  call(
          {String? gitRepo,
          String? gitBranch,
          String? serverFile,
          List<Input$CliCommandInput>? commands}) =>
      _res;
  commands(_fn) => _res;
}

@JsonSerializable(explicitToJson: true)
class Input$CliCommandInput {
  Input$CliCommandInput(
      {required this.name, required this.command, required this.variables});

  @override
  factory Input$CliCommandInput.fromJson(Map<String, dynamic> json) =>
      _$Input$CliCommandInputFromJson(json);

  final String name;

  final String command;

  final List<Input$CliCommandVariableInput> variables;

  Map<String, dynamic> toJson() => _$Input$CliCommandInputToJson(this);
  int get hashCode {
    final l$name = name;
    final l$command = command;
    final l$variables = variables;
    return Object.hashAll(
        [l$name, l$command, Object.hashAll(l$variables.map((v) => v))]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$CliCommandInput) || runtimeType != other.runtimeType)
      return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$command = command;
    final lOther$command = other.command;
    if (l$command != lOther$command) return false;
    final l$variables = variables;
    final lOther$variables = other.variables;
    if (l$variables.length != lOther$variables.length) return false;
    for (int i = 0; i < l$variables.length; i++) {
      final l$variables$entry = l$variables[i];
      final lOther$variables$entry = lOther$variables[i];
      if (l$variables$entry != lOther$variables$entry) return false;
    }

    return true;
  }

  CopyWith$Input$CliCommandInput<Input$CliCommandInput> get copyWith =>
      CopyWith$Input$CliCommandInput(this, (i) => i);
}

abstract class CopyWith$Input$CliCommandInput<TRes> {
  factory CopyWith$Input$CliCommandInput(Input$CliCommandInput instance,
          TRes Function(Input$CliCommandInput) then) =
      _CopyWithImpl$Input$CliCommandInput;

  factory CopyWith$Input$CliCommandInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CliCommandInput;

  TRes call(
      {String? name,
      String? command,
      List<Input$CliCommandVariableInput>? variables});
  TRes variables(
      Iterable<Input$CliCommandVariableInput> Function(
              Iterable<
                  CopyWith$Input$CliCommandVariableInput<
                      Input$CliCommandVariableInput>>)
          _fn);
}

class _CopyWithImpl$Input$CliCommandInput<TRes>
    implements CopyWith$Input$CliCommandInput<TRes> {
  _CopyWithImpl$Input$CliCommandInput(this._instance, this._then);

  final Input$CliCommandInput _instance;

  final TRes Function(Input$CliCommandInput) _then;

  static const _undefined = {};

  TRes call(
          {Object? name = _undefined,
          Object? command = _undefined,
          Object? variables = _undefined}) =>
      _then(Input$CliCommandInput(
          name: name == _undefined || name == null
              ? _instance.name
              : (name as String),
          command: command == _undefined || command == null
              ? _instance.command
              : (command as String),
          variables: variables == _undefined || variables == null
              ? _instance.variables
              : (variables as List<Input$CliCommandVariableInput>)));
  TRes variables(
          Iterable<Input$CliCommandVariableInput> Function(
                  Iterable<
                      CopyWith$Input$CliCommandVariableInput<
                          Input$CliCommandVariableInput>>)
              _fn) =>
      call(
          variables: _fn(_instance.variables.map(
                  (e) => CopyWith$Input$CliCommandVariableInput(e, (i) => i)))
              .toList());
}

class _CopyWithStubImpl$Input$CliCommandInput<TRes>
    implements CopyWith$Input$CliCommandInput<TRes> {
  _CopyWithStubImpl$Input$CliCommandInput(this._res);

  TRes _res;

  call(
          {String? name,
          String? command,
          List<Input$CliCommandVariableInput>? variables}) =>
      _res;
  variables(_fn) => _res;
}

@JsonSerializable(explicitToJson: true)
class Input$CliCommandVariableInput {
  Input$CliCommandVariableInput({required this.type, required this.value});

  @override
  factory Input$CliCommandVariableInput.fromJson(Map<String, dynamic> json) =>
      _$Input$CliCommandVariableInputFromJson(json);

  @JsonKey(unknownEnumValue: Enum$CliCommandVariableType.$unknown)
  final Enum$CliCommandVariableType type;

  final String value;

  Map<String, dynamic> toJson() => _$Input$CliCommandVariableInputToJson(this);
  int get hashCode {
    final l$type = type;
    final l$value = value;
    return Object.hashAll([l$type, l$value]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$CliCommandVariableInput) ||
        runtimeType != other.runtimeType) return false;
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) return false;
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) return false;
    return true;
  }

  CopyWith$Input$CliCommandVariableInput<Input$CliCommandVariableInput>
      get copyWith => CopyWith$Input$CliCommandVariableInput(this, (i) => i);
}

abstract class CopyWith$Input$CliCommandVariableInput<TRes> {
  factory CopyWith$Input$CliCommandVariableInput(
          Input$CliCommandVariableInput instance,
          TRes Function(Input$CliCommandVariableInput) then) =
      _CopyWithImpl$Input$CliCommandVariableInput;

  factory CopyWith$Input$CliCommandVariableInput.stub(TRes res) =
      _CopyWithStubImpl$Input$CliCommandVariableInput;

  TRes call({Enum$CliCommandVariableType? type, String? value});
}

class _CopyWithImpl$Input$CliCommandVariableInput<TRes>
    implements CopyWith$Input$CliCommandVariableInput<TRes> {
  _CopyWithImpl$Input$CliCommandVariableInput(this._instance, this._then);

  final Input$CliCommandVariableInput _instance;

  final TRes Function(Input$CliCommandVariableInput) _then;

  static const _undefined = {};

  TRes call({Object? type = _undefined, Object? value = _undefined}) =>
      _then(Input$CliCommandVariableInput(
          type: type == _undefined || type == null
              ? _instance.type
              : (type as Enum$CliCommandVariableType),
          value: value == _undefined || value == null
              ? _instance.value
              : (value as String)));
}

class _CopyWithStubImpl$Input$CliCommandVariableInput<TRes>
    implements CopyWith$Input$CliCommandVariableInput<TRes> {
  _CopyWithStubImpl$Input$CliCommandVariableInput(this._res);

  TRes _res;

  call({Enum$CliCommandVariableType? type, String? value}) => _res;
}

@JsonSerializable(explicitToJson: true)
class Input$CompilationFilter {
  Input$CompilationFilter(
      {this.gitRepo,
      this.gitBranch,
      this.serverFile,
      this.commitHash,
      this.statusIsIn,
      this.startTime,
      this.endTime});

  @override
  factory Input$CompilationFilter.fromJson(Map<String, dynamic> json) =>
      _$Input$CompilationFilterFromJson(json);

  final Input$StringFilter? gitRepo;

  final Input$StringFilter? gitBranch;

  final Input$StringFilter? serverFile;

  final Input$StringFilter? commitHash;

  @JsonKey(unknownEnumValue: Enum$CompilationStatus.$unknown)
  final List<Enum$CompilationStatus>? statusIsIn;

  final Input$DateTimeFilter? startTime;

  final Input$DateTimeFilter? endTime;

  Map<String, dynamic> toJson() => _$Input$CompilationFilterToJson(this);
  int get hashCode {
    final l$gitRepo = gitRepo;
    final l$gitBranch = gitBranch;
    final l$serverFile = serverFile;
    final l$commitHash = commitHash;
    final l$statusIsIn = statusIsIn;
    final l$startTime = startTime;
    final l$endTime = endTime;
    return Object.hashAll([
      l$gitRepo,
      l$gitBranch,
      l$serverFile,
      l$commitHash,
      l$statusIsIn == null ? null : Object.hashAll(l$statusIsIn.map((v) => v)),
      l$startTime,
      l$endTime
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$CompilationFilter) || runtimeType != other.runtimeType)
      return false;
    final l$gitRepo = gitRepo;
    final lOther$gitRepo = other.gitRepo;
    if (l$gitRepo != lOther$gitRepo) return false;
    final l$gitBranch = gitBranch;
    final lOther$gitBranch = other.gitBranch;
    if (l$gitBranch != lOther$gitBranch) return false;
    final l$serverFile = serverFile;
    final lOther$serverFile = other.serverFile;
    if (l$serverFile != lOther$serverFile) return false;
    final l$commitHash = commitHash;
    final lOther$commitHash = other.commitHash;
    if (l$commitHash != lOther$commitHash) return false;
    final l$statusIsIn = statusIsIn;
    final lOther$statusIsIn = other.statusIsIn;
    if (l$statusIsIn != null && lOther$statusIsIn != null) {
      if (l$statusIsIn.length != lOther$statusIsIn.length) return false;
      for (int i = 0; i < l$statusIsIn.length; i++) {
        final l$statusIsIn$entry = l$statusIsIn[i];
        final lOther$statusIsIn$entry = lOther$statusIsIn[i];
        if (l$statusIsIn$entry != lOther$statusIsIn$entry) return false;
      }
    } else if (l$statusIsIn != lOther$statusIsIn) {
      return false;
    }

    final l$startTime = startTime;
    final lOther$startTime = other.startTime;
    if (l$startTime != lOther$startTime) return false;
    final l$endTime = endTime;
    final lOther$endTime = other.endTime;
    if (l$endTime != lOther$endTime) return false;
    return true;
  }

  CopyWith$Input$CompilationFilter<Input$CompilationFilter> get copyWith =>
      CopyWith$Input$CompilationFilter(this, (i) => i);
}

abstract class CopyWith$Input$CompilationFilter<TRes> {
  factory CopyWith$Input$CompilationFilter(Input$CompilationFilter instance,
          TRes Function(Input$CompilationFilter) then) =
      _CopyWithImpl$Input$CompilationFilter;

  factory CopyWith$Input$CompilationFilter.stub(TRes res) =
      _CopyWithStubImpl$Input$CompilationFilter;

  TRes call(
      {Input$StringFilter? gitRepo,
      Input$StringFilter? gitBranch,
      Input$StringFilter? serverFile,
      Input$StringFilter? commitHash,
      List<Enum$CompilationStatus>? statusIsIn,
      Input$DateTimeFilter? startTime,
      Input$DateTimeFilter? endTime});
  CopyWith$Input$StringFilter<TRes> get gitRepo;
  CopyWith$Input$StringFilter<TRes> get gitBranch;
  CopyWith$Input$StringFilter<TRes> get serverFile;
  CopyWith$Input$StringFilter<TRes> get commitHash;
  CopyWith$Input$DateTimeFilter<TRes> get startTime;
  CopyWith$Input$DateTimeFilter<TRes> get endTime;
}

class _CopyWithImpl$Input$CompilationFilter<TRes>
    implements CopyWith$Input$CompilationFilter<TRes> {
  _CopyWithImpl$Input$CompilationFilter(this._instance, this._then);

  final Input$CompilationFilter _instance;

  final TRes Function(Input$CompilationFilter) _then;

  static const _undefined = {};

  TRes call(
          {Object? gitRepo = _undefined,
          Object? gitBranch = _undefined,
          Object? serverFile = _undefined,
          Object? commitHash = _undefined,
          Object? statusIsIn = _undefined,
          Object? startTime = _undefined,
          Object? endTime = _undefined}) =>
      _then(Input$CompilationFilter(
          gitRepo: gitRepo == _undefined
              ? _instance.gitRepo
              : (gitRepo as Input$StringFilter?),
          gitBranch: gitBranch == _undefined
              ? _instance.gitBranch
              : (gitBranch as Input$StringFilter?),
          serverFile: serverFile == _undefined
              ? _instance.serverFile
              : (serverFile as Input$StringFilter?),
          commitHash: commitHash == _undefined
              ? _instance.commitHash
              : (commitHash as Input$StringFilter?),
          statusIsIn: statusIsIn == _undefined
              ? _instance.statusIsIn
              : (statusIsIn as List<Enum$CompilationStatus>?),
          startTime: startTime == _undefined
              ? _instance.startTime
              : (startTime as Input$DateTimeFilter?),
          endTime: endTime == _undefined
              ? _instance.endTime
              : (endTime as Input$DateTimeFilter?)));
  CopyWith$Input$StringFilter<TRes> get gitRepo {
    final local$gitRepo = _instance.gitRepo;
    return local$gitRepo == null
        ? CopyWith$Input$StringFilter.stub(_then(_instance))
        : CopyWith$Input$StringFilter(local$gitRepo, (e) => call(gitRepo: e));
  }

  CopyWith$Input$StringFilter<TRes> get gitBranch {
    final local$gitBranch = _instance.gitBranch;
    return local$gitBranch == null
        ? CopyWith$Input$StringFilter.stub(_then(_instance))
        : CopyWith$Input$StringFilter(
            local$gitBranch, (e) => call(gitBranch: e));
  }

  CopyWith$Input$StringFilter<TRes> get serverFile {
    final local$serverFile = _instance.serverFile;
    return local$serverFile == null
        ? CopyWith$Input$StringFilter.stub(_then(_instance))
        : CopyWith$Input$StringFilter(
            local$serverFile, (e) => call(serverFile: e));
  }

  CopyWith$Input$StringFilter<TRes> get commitHash {
    final local$commitHash = _instance.commitHash;
    return local$commitHash == null
        ? CopyWith$Input$StringFilter.stub(_then(_instance))
        : CopyWith$Input$StringFilter(
            local$commitHash, (e) => call(commitHash: e));
  }

  CopyWith$Input$DateTimeFilter<TRes> get startTime {
    final local$startTime = _instance.startTime;
    return local$startTime == null
        ? CopyWith$Input$DateTimeFilter.stub(_then(_instance))
        : CopyWith$Input$DateTimeFilter(
            local$startTime, (e) => call(startTime: e));
  }

  CopyWith$Input$DateTimeFilter<TRes> get endTime {
    final local$endTime = _instance.endTime;
    return local$endTime == null
        ? CopyWith$Input$DateTimeFilter.stub(_then(_instance))
        : CopyWith$Input$DateTimeFilter(local$endTime, (e) => call(endTime: e));
  }
}

class _CopyWithStubImpl$Input$CompilationFilter<TRes>
    implements CopyWith$Input$CompilationFilter<TRes> {
  _CopyWithStubImpl$Input$CompilationFilter(this._res);

  TRes _res;

  call(
          {Input$StringFilter? gitRepo,
          Input$StringFilter? gitBranch,
          Input$StringFilter? serverFile,
          Input$StringFilter? commitHash,
          List<Enum$CompilationStatus>? statusIsIn,
          Input$DateTimeFilter? startTime,
          Input$DateTimeFilter? endTime}) =>
      _res;
  CopyWith$Input$StringFilter<TRes> get gitRepo =>
      CopyWith$Input$StringFilter.stub(_res);
  CopyWith$Input$StringFilter<TRes> get gitBranch =>
      CopyWith$Input$StringFilter.stub(_res);
  CopyWith$Input$StringFilter<TRes> get serverFile =>
      CopyWith$Input$StringFilter.stub(_res);
  CopyWith$Input$StringFilter<TRes> get commitHash =>
      CopyWith$Input$StringFilter.stub(_res);
  CopyWith$Input$DateTimeFilter<TRes> get startTime =>
      CopyWith$Input$DateTimeFilter.stub(_res);
  CopyWith$Input$DateTimeFilter<TRes> get endTime =>
      CopyWith$Input$DateTimeFilter.stub(_res);
}

@JsonSerializable(explicitToJson: true)
class Input$StringFilter {
  Input$StringFilter({this.contains, this.regExp, this.isIn});

  @override
  factory Input$StringFilter.fromJson(Map<String, dynamic> json) =>
      _$Input$StringFilterFromJson(json);

  final String? contains;

  final String? regExp;

  final List<String>? isIn;

  Map<String, dynamic> toJson() => _$Input$StringFilterToJson(this);
  int get hashCode {
    final l$contains = contains;
    final l$regExp = regExp;
    final l$isIn = isIn;
    return Object.hashAll([
      l$contains,
      l$regExp,
      l$isIn == null ? null : Object.hashAll(l$isIn.map((v) => v))
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$StringFilter) || runtimeType != other.runtimeType)
      return false;
    final l$contains = contains;
    final lOther$contains = other.contains;
    if (l$contains != lOther$contains) return false;
    final l$regExp = regExp;
    final lOther$regExp = other.regExp;
    if (l$regExp != lOther$regExp) return false;
    final l$isIn = isIn;
    final lOther$isIn = other.isIn;
    if (l$isIn != null && lOther$isIn != null) {
      if (l$isIn.length != lOther$isIn.length) return false;
      for (int i = 0; i < l$isIn.length; i++) {
        final l$isIn$entry = l$isIn[i];
        final lOther$isIn$entry = lOther$isIn[i];
        if (l$isIn$entry != lOther$isIn$entry) return false;
      }
    } else if (l$isIn != lOther$isIn) {
      return false;
    }

    return true;
  }

  CopyWith$Input$StringFilter<Input$StringFilter> get copyWith =>
      CopyWith$Input$StringFilter(this, (i) => i);
}

abstract class CopyWith$Input$StringFilter<TRes> {
  factory CopyWith$Input$StringFilter(
          Input$StringFilter instance, TRes Function(Input$StringFilter) then) =
      _CopyWithImpl$Input$StringFilter;

  factory CopyWith$Input$StringFilter.stub(TRes res) =
      _CopyWithStubImpl$Input$StringFilter;

  TRes call({String? contains, String? regExp, List<String>? isIn});
}

class _CopyWithImpl$Input$StringFilter<TRes>
    implements CopyWith$Input$StringFilter<TRes> {
  _CopyWithImpl$Input$StringFilter(this._instance, this._then);

  final Input$StringFilter _instance;

  final TRes Function(Input$StringFilter) _then;

  static const _undefined = {};

  TRes call(
          {Object? contains = _undefined,
          Object? regExp = _undefined,
          Object? isIn = _undefined}) =>
      _then(Input$StringFilter(
          contains: contains == _undefined
              ? _instance.contains
              : (contains as String?),
          regExp: regExp == _undefined ? _instance.regExp : (regExp as String?),
          isIn: isIn == _undefined ? _instance.isIn : (isIn as List<String>?)));
}

class _CopyWithStubImpl$Input$StringFilter<TRes>
    implements CopyWith$Input$StringFilter<TRes> {
  _CopyWithStubImpl$Input$StringFilter(this._res);

  TRes _res;

  call({String? contains, String? regExp, List<String>? isIn}) => _res;
}

@JsonSerializable(explicitToJson: true)
class Input$DateTimeFilter {
  Input$DateTimeFilter({this.before, this.after});

  @override
  factory Input$DateTimeFilter.fromJson(Map<String, dynamic> json) =>
      _$Input$DateTimeFilterFromJson(json);

  final DateTime? before;

  final DateTime? after;

  Map<String, dynamic> toJson() => _$Input$DateTimeFilterToJson(this);
  int get hashCode {
    final l$before = before;
    final l$after = after;
    return Object.hashAll([l$before, l$after]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Input$DateTimeFilter) || runtimeType != other.runtimeType)
      return false;
    final l$before = before;
    final lOther$before = other.before;
    if (l$before != lOther$before) return false;
    final l$after = after;
    final lOther$after = other.after;
    if (l$after != lOther$after) return false;
    return true;
  }

  CopyWith$Input$DateTimeFilter<Input$DateTimeFilter> get copyWith =>
      CopyWith$Input$DateTimeFilter(this, (i) => i);
}

abstract class CopyWith$Input$DateTimeFilter<TRes> {
  factory CopyWith$Input$DateTimeFilter(Input$DateTimeFilter instance,
          TRes Function(Input$DateTimeFilter) then) =
      _CopyWithImpl$Input$DateTimeFilter;

  factory CopyWith$Input$DateTimeFilter.stub(TRes res) =
      _CopyWithStubImpl$Input$DateTimeFilter;

  TRes call({DateTime? before, DateTime? after});
}

class _CopyWithImpl$Input$DateTimeFilter<TRes>
    implements CopyWith$Input$DateTimeFilter<TRes> {
  _CopyWithImpl$Input$DateTimeFilter(this._instance, this._then);

  final Input$DateTimeFilter _instance;

  final TRes Function(Input$DateTimeFilter) _then;

  static const _undefined = {};

  TRes call({Object? before = _undefined, Object? after = _undefined}) =>
      _then(Input$DateTimeFilter(
          before:
              before == _undefined ? _instance.before : (before as DateTime?),
          after: after == _undefined ? _instance.after : (after as DateTime?)));
}

class _CopyWithStubImpl$Input$DateTimeFilter<TRes>
    implements CopyWith$Input$DateTimeFilter<TRes> {
  _CopyWithStubImpl$Input$DateTimeFilter(this._res);

  TRes _res;

  call({DateTime? before, DateTime? after}) => _res;
}

enum Enum$CliCommandVariableType {
  @JsonValue('environment')
  environment,
  @JsonValue('constant')
  constant,
  @JsonValue('dynamic')
  $dynamic,
  $unknown
}

enum Enum$CompilationStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('started')
  started,
  @JsonValue('error')
  error,
  @JsonValue('success')
  success,
  $unknown
}

const possibleTypesMap = {};
