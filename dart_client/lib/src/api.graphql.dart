import '../schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:json_annotation/json_annotation.dart';
part 'api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Fragment$CompilationLogF {
  Fragment$CompilationLogF(
      {required this.message,
      required this.time,
      this.command,
      required this.$__typename});

  @override
  factory Fragment$CompilationLogF.fromJson(Map<String, dynamic> json) =>
      _$Fragment$CompilationLogFFromJson(json);

  final String message;

  final DateTime time;

  final Fragment$CompilationLogF$command? command;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Fragment$CompilationLogFToJson(this);
  int get hashCode {
    final l$message = message;
    final l$time = time;
    final l$command = command;
    final l$$__typename = $__typename;
    return Object.hashAll([l$message, l$time, l$command, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$CompilationLogF) ||
        runtimeType != other.runtimeType) return false;
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) return false;
    final l$time = time;
    final lOther$time = other.time;
    if (l$time != lOther$time) return false;
    final l$command = command;
    final lOther$command = other.command;
    if (l$command != lOther$command) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Fragment$CompilationLogF
    on Fragment$CompilationLogF {
  CopyWith$Fragment$CompilationLogF<Fragment$CompilationLogF> get copyWith =>
      CopyWith$Fragment$CompilationLogF(this, (i) => i);
}

abstract class CopyWith$Fragment$CompilationLogF<TRes> {
  factory CopyWith$Fragment$CompilationLogF(Fragment$CompilationLogF instance,
          TRes Function(Fragment$CompilationLogF) then) =
      _CopyWithImpl$Fragment$CompilationLogF;

  factory CopyWith$Fragment$CompilationLogF.stub(TRes res) =
      _CopyWithStubImpl$Fragment$CompilationLogF;

  TRes call(
      {String? message,
      DateTime? time,
      Fragment$CompilationLogF$command? command,
      String? $__typename});
  CopyWith$Fragment$CompilationLogF$command<TRes> get command;
}

class _CopyWithImpl$Fragment$CompilationLogF<TRes>
    implements CopyWith$Fragment$CompilationLogF<TRes> {
  _CopyWithImpl$Fragment$CompilationLogF(this._instance, this._then);

  final Fragment$CompilationLogF _instance;

  final TRes Function(Fragment$CompilationLogF) _then;

  static const _undefined = {};

  TRes call(
          {Object? message = _undefined,
          Object? time = _undefined,
          Object? command = _undefined,
          Object? $__typename = _undefined}) =>
      _then(Fragment$CompilationLogF(
          message: message == _undefined || message == null
              ? _instance.message
              : (message as String),
          time: time == _undefined || time == null
              ? _instance.time
              : (time as DateTime),
          command: command == _undefined
              ? _instance.command
              : (command as Fragment$CompilationLogF$command?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
  CopyWith$Fragment$CompilationLogF$command<TRes> get command {
    final local$command = _instance.command;
    return local$command == null
        ? CopyWith$Fragment$CompilationLogF$command.stub(_then(_instance))
        : CopyWith$Fragment$CompilationLogF$command(
            local$command, (e) => call(command: e));
  }
}

class _CopyWithStubImpl$Fragment$CompilationLogF<TRes>
    implements CopyWith$Fragment$CompilationLogF<TRes> {
  _CopyWithStubImpl$Fragment$CompilationLogF(this._res);

  TRes _res;

  call(
          {String? message,
          DateTime? time,
          Fragment$CompilationLogF$command? command,
          String? $__typename}) =>
      _res;
  CopyWith$Fragment$CompilationLogF$command<TRes> get command =>
      CopyWith$Fragment$CompilationLogF$command.stub(_res);
}

const fragmentDefinitionCompilationLogF = FragmentDefinitionNode(
    name: NameNode(value: 'CompilationLogF'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
            name: NameNode(value: 'CompilationLog'), isNonNull: false)),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
          name: NameNode(value: 'message'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'time'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'command'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
                name: NameNode(value: 'result'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                      name: NameNode(value: 'ProcessExecResultF'),
                      directives: []),
                  FieldNode(
                      name: NameNode(value: '__typename'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null)
                ])),
            FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null)
          ])),
      FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const documentNodeFragmentCompilationLogF = DocumentNode(definitions: [
  fragmentDefinitionCompilationLogF,
  fragmentDefinitionProcessExecResultF,
]);

extension ClientExtension$Fragment$CompilationLogF on graphql.GraphQLClient {
  void writeFragment$CompilationLogF(
          {required Fragment$CompilationLogF data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'CompilationLogF',
                  document: documentNodeFragmentCompilationLogF)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$CompilationLogF? readFragment$CompilationLogF(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'CompilationLogF',
                document: documentNodeFragmentCompilationLogF)),
        optimistic: optimistic);
    return result == null ? null : Fragment$CompilationLogF.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Fragment$CompilationLogF$command {
  Fragment$CompilationLogF$command({this.result, required this.$__typename});

  @override
  factory Fragment$CompilationLogF$command.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$CompilationLogF$commandFromJson(json);

  final Fragment$ProcessExecResultF? result;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$CompilationLogF$commandToJson(this);
  int get hashCode {
    final l$result = result;
    final l$$__typename = $__typename;
    return Object.hashAll([l$result, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$CompilationLogF$command) ||
        runtimeType != other.runtimeType) return false;
    final l$result = result;
    final lOther$result = other.result;
    if (l$result != lOther$result) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Fragment$CompilationLogF$command
    on Fragment$CompilationLogF$command {
  CopyWith$Fragment$CompilationLogF$command<Fragment$CompilationLogF$command>
      get copyWith => CopyWith$Fragment$CompilationLogF$command(this, (i) => i);
}

abstract class CopyWith$Fragment$CompilationLogF$command<TRes> {
  factory CopyWith$Fragment$CompilationLogF$command(
          Fragment$CompilationLogF$command instance,
          TRes Function(Fragment$CompilationLogF$command) then) =
      _CopyWithImpl$Fragment$CompilationLogF$command;

  factory CopyWith$Fragment$CompilationLogF$command.stub(TRes res) =
      _CopyWithStubImpl$Fragment$CompilationLogF$command;

  TRes call({Fragment$ProcessExecResultF? result, String? $__typename});
  CopyWith$Fragment$ProcessExecResultF<TRes> get result;
}

class _CopyWithImpl$Fragment$CompilationLogF$command<TRes>
    implements CopyWith$Fragment$CompilationLogF$command<TRes> {
  _CopyWithImpl$Fragment$CompilationLogF$command(this._instance, this._then);

  final Fragment$CompilationLogF$command _instance;

  final TRes Function(Fragment$CompilationLogF$command) _then;

  static const _undefined = {};

  TRes call({Object? result = _undefined, Object? $__typename = _undefined}) =>
      _then(Fragment$CompilationLogF$command(
          result: result == _undefined
              ? _instance.result
              : (result as Fragment$ProcessExecResultF?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
  CopyWith$Fragment$ProcessExecResultF<TRes> get result {
    final local$result = _instance.result;
    return local$result == null
        ? CopyWith$Fragment$ProcessExecResultF.stub(_then(_instance))
        : CopyWith$Fragment$ProcessExecResultF(
            local$result, (e) => call(result: e));
  }
}

class _CopyWithStubImpl$Fragment$CompilationLogF$command<TRes>
    implements CopyWith$Fragment$CompilationLogF$command<TRes> {
  _CopyWithStubImpl$Fragment$CompilationLogF$command(this._res);

  TRes _res;

  call({Fragment$ProcessExecResultF? result, String? $__typename}) => _res;
  CopyWith$Fragment$ProcessExecResultF<TRes> get result =>
      CopyWith$Fragment$ProcessExecResultF.stub(_res);
}

@JsonSerializable(explicitToJson: true)
class Fragment$CommandExecutionF {
  Fragment$CommandExecutionF(
      {required this.command,
      required this.status,
      this.durationMs,
      this.endTime,
      this.result,
      required this.$__typename});

  @override
  factory Fragment$CommandExecutionF.fromJson(Map<String, dynamic> json) =>
      _$Fragment$CommandExecutionFFromJson(json);

  final Fragment$CommandExecutionF$command command;

  @JsonKey(unknownEnumValue: Enum$CompilationStatus.$unknown)
  final Enum$CompilationStatus status;

  final int? durationMs;

  final DateTime? endTime;

  final Fragment$ProcessExecResultF? result;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Fragment$CommandExecutionFToJson(this);
  int get hashCode {
    final l$command = command;
    final l$status = status;
    final l$durationMs = durationMs;
    final l$endTime = endTime;
    final l$result = result;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$command,
      l$status,
      l$durationMs,
      l$endTime,
      l$result,
      l$$__typename
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$CommandExecutionF) ||
        runtimeType != other.runtimeType) return false;
    final l$command = command;
    final lOther$command = other.command;
    if (l$command != lOther$command) return false;
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) return false;
    final l$durationMs = durationMs;
    final lOther$durationMs = other.durationMs;
    if (l$durationMs != lOther$durationMs) return false;
    final l$endTime = endTime;
    final lOther$endTime = other.endTime;
    if (l$endTime != lOther$endTime) return false;
    final l$result = result;
    final lOther$result = other.result;
    if (l$result != lOther$result) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Fragment$CommandExecutionF
    on Fragment$CommandExecutionF {
  CopyWith$Fragment$CommandExecutionF<Fragment$CommandExecutionF>
      get copyWith => CopyWith$Fragment$CommandExecutionF(this, (i) => i);
}

abstract class CopyWith$Fragment$CommandExecutionF<TRes> {
  factory CopyWith$Fragment$CommandExecutionF(
          Fragment$CommandExecutionF instance,
          TRes Function(Fragment$CommandExecutionF) then) =
      _CopyWithImpl$Fragment$CommandExecutionF;

  factory CopyWith$Fragment$CommandExecutionF.stub(TRes res) =
      _CopyWithStubImpl$Fragment$CommandExecutionF;

  TRes call(
      {Fragment$CommandExecutionF$command? command,
      Enum$CompilationStatus? status,
      int? durationMs,
      DateTime? endTime,
      Fragment$ProcessExecResultF? result,
      String? $__typename});
  CopyWith$Fragment$CommandExecutionF$command<TRes> get command;
  CopyWith$Fragment$ProcessExecResultF<TRes> get result;
}

class _CopyWithImpl$Fragment$CommandExecutionF<TRes>
    implements CopyWith$Fragment$CommandExecutionF<TRes> {
  _CopyWithImpl$Fragment$CommandExecutionF(this._instance, this._then);

  final Fragment$CommandExecutionF _instance;

  final TRes Function(Fragment$CommandExecutionF) _then;

  static const _undefined = {};

  TRes call(
          {Object? command = _undefined,
          Object? status = _undefined,
          Object? durationMs = _undefined,
          Object? endTime = _undefined,
          Object? result = _undefined,
          Object? $__typename = _undefined}) =>
      _then(Fragment$CommandExecutionF(
          command: command == _undefined || command == null
              ? _instance.command
              : (command as Fragment$CommandExecutionF$command),
          status: status == _undefined || status == null
              ? _instance.status
              : (status as Enum$CompilationStatus),
          durationMs: durationMs == _undefined
              ? _instance.durationMs
              : (durationMs as int?),
          endTime: endTime == _undefined
              ? _instance.endTime
              : (endTime as DateTime?),
          result: result == _undefined
              ? _instance.result
              : (result as Fragment$ProcessExecResultF?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
  CopyWith$Fragment$CommandExecutionF$command<TRes> get command {
    final local$command = _instance.command;
    return CopyWith$Fragment$CommandExecutionF$command(
        local$command, (e) => call(command: e));
  }

  CopyWith$Fragment$ProcessExecResultF<TRes> get result {
    final local$result = _instance.result;
    return local$result == null
        ? CopyWith$Fragment$ProcessExecResultF.stub(_then(_instance))
        : CopyWith$Fragment$ProcessExecResultF(
            local$result, (e) => call(result: e));
  }
}

class _CopyWithStubImpl$Fragment$CommandExecutionF<TRes>
    implements CopyWith$Fragment$CommandExecutionF<TRes> {
  _CopyWithStubImpl$Fragment$CommandExecutionF(this._res);

  TRes _res;

  call(
          {Fragment$CommandExecutionF$command? command,
          Enum$CompilationStatus? status,
          int? durationMs,
          DateTime? endTime,
          Fragment$ProcessExecResultF? result,
          String? $__typename}) =>
      _res;
  CopyWith$Fragment$CommandExecutionF$command<TRes> get command =>
      CopyWith$Fragment$CommandExecutionF$command.stub(_res);
  CopyWith$Fragment$ProcessExecResultF<TRes> get result =>
      CopyWith$Fragment$ProcessExecResultF.stub(_res);
}

const fragmentDefinitionCommandExecutionF = FragmentDefinitionNode(
    name: NameNode(value: 'CommandExecutionF'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
            name: NameNode(value: 'CommandExecution'), isNonNull: false)),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
          name: NameNode(value: 'command'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            FieldNode(
                name: NameNode(value: 'command'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            FieldNode(
                name: NameNode(value: 'modifiedDate'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null)
          ])),
      FieldNode(
          name: NameNode(value: 'status'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'durationMs'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'endTime'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'result'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FragmentSpreadNode(
                name: NameNode(value: 'ProcessExecResultF'), directives: []),
            FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null)
          ])),
      FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const documentNodeFragmentCommandExecutionF = DocumentNode(definitions: [
  fragmentDefinitionCommandExecutionF,
  fragmentDefinitionProcessExecResultF,
]);

extension ClientExtension$Fragment$CommandExecutionF on graphql.GraphQLClient {
  void writeFragment$CommandExecutionF(
          {required Fragment$CommandExecutionF data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'CommandExecutionF',
                  document: documentNodeFragmentCommandExecutionF)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$CommandExecutionF? readFragment$CommandExecutionF(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'CommandExecutionF',
                document: documentNodeFragmentCommandExecutionF)),
        optimistic: optimistic);
    return result == null ? null : Fragment$CommandExecutionF.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Fragment$CommandExecutionF$command {
  Fragment$CommandExecutionF$command(
      {required this.name,
      required this.command,
      required this.modifiedDate,
      required this.$__typename});

  @override
  factory Fragment$CommandExecutionF$command.fromJson(
          Map<String, dynamic> json) =>
      _$Fragment$CommandExecutionF$commandFromJson(json);

  final String name;

  final List<String> command;

  final DateTime modifiedDate;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() =>
      _$Fragment$CommandExecutionF$commandToJson(this);
  int get hashCode {
    final l$name = name;
    final l$command = command;
    final l$modifiedDate = modifiedDate;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      Object.hashAll(l$command.map((v) => v)),
      l$modifiedDate,
      l$$__typename
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$CommandExecutionF$command) ||
        runtimeType != other.runtimeType) return false;
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) return false;
    final l$command = command;
    final lOther$command = other.command;
    if (l$command.length != lOther$command.length) return false;
    for (int i = 0; i < l$command.length; i++) {
      final l$command$entry = l$command[i];
      final lOther$command$entry = lOther$command[i];
      if (l$command$entry != lOther$command$entry) return false;
    }

    final l$modifiedDate = modifiedDate;
    final lOther$modifiedDate = other.modifiedDate;
    if (l$modifiedDate != lOther$modifiedDate) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Fragment$CommandExecutionF$command
    on Fragment$CommandExecutionF$command {
  CopyWith$Fragment$CommandExecutionF$command<
          Fragment$CommandExecutionF$command>
      get copyWith =>
          CopyWith$Fragment$CommandExecutionF$command(this, (i) => i);
}

abstract class CopyWith$Fragment$CommandExecutionF$command<TRes> {
  factory CopyWith$Fragment$CommandExecutionF$command(
          Fragment$CommandExecutionF$command instance,
          TRes Function(Fragment$CommandExecutionF$command) then) =
      _CopyWithImpl$Fragment$CommandExecutionF$command;

  factory CopyWith$Fragment$CommandExecutionF$command.stub(TRes res) =
      _CopyWithStubImpl$Fragment$CommandExecutionF$command;

  TRes call(
      {String? name,
      List<String>? command,
      DateTime? modifiedDate,
      String? $__typename});
}

class _CopyWithImpl$Fragment$CommandExecutionF$command<TRes>
    implements CopyWith$Fragment$CommandExecutionF$command<TRes> {
  _CopyWithImpl$Fragment$CommandExecutionF$command(this._instance, this._then);

  final Fragment$CommandExecutionF$command _instance;

  final TRes Function(Fragment$CommandExecutionF$command) _then;

  static const _undefined = {};

  TRes call(
          {Object? name = _undefined,
          Object? command = _undefined,
          Object? modifiedDate = _undefined,
          Object? $__typename = _undefined}) =>
      _then(Fragment$CommandExecutionF$command(
          name: name == _undefined || name == null
              ? _instance.name
              : (name as String),
          command: command == _undefined || command == null
              ? _instance.command
              : (command as List<String>),
          modifiedDate: modifiedDate == _undefined || modifiedDate == null
              ? _instance.modifiedDate
              : (modifiedDate as DateTime),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$CommandExecutionF$command<TRes>
    implements CopyWith$Fragment$CommandExecutionF$command<TRes> {
  _CopyWithStubImpl$Fragment$CommandExecutionF$command(this._res);

  TRes _res;

  call(
          {String? name,
          List<String>? command,
          DateTime? modifiedDate,
          String? $__typename}) =>
      _res;
}

@JsonSerializable(explicitToJson: true)
class Fragment$ProcessExecResultF {
  Fragment$ProcessExecResultF(
      {required this.exitCode,
      required this.pid,
      required this.stderr,
      required this.stdout,
      required this.$__typename});

  @override
  factory Fragment$ProcessExecResultF.fromJson(Map<String, dynamic> json) =>
      _$Fragment$ProcessExecResultFFromJson(json);

  final int exitCode;

  final int pid;

  final String stderr;

  final String stdout;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Fragment$ProcessExecResultFToJson(this);
  int get hashCode {
    final l$exitCode = exitCode;
    final l$pid = pid;
    final l$stderr = stderr;
    final l$stdout = stdout;
    final l$$__typename = $__typename;
    return Object.hashAll(
        [l$exitCode, l$pid, l$stderr, l$stdout, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Fragment$ProcessExecResultF) ||
        runtimeType != other.runtimeType) return false;
    final l$exitCode = exitCode;
    final lOther$exitCode = other.exitCode;
    if (l$exitCode != lOther$exitCode) return false;
    final l$pid = pid;
    final lOther$pid = other.pid;
    if (l$pid != lOther$pid) return false;
    final l$stderr = stderr;
    final lOther$stderr = other.stderr;
    if (l$stderr != lOther$stderr) return false;
    final l$stdout = stdout;
    final lOther$stdout = other.stdout;
    if (l$stdout != lOther$stdout) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Fragment$ProcessExecResultF
    on Fragment$ProcessExecResultF {
  CopyWith$Fragment$ProcessExecResultF<Fragment$ProcessExecResultF>
      get copyWith => CopyWith$Fragment$ProcessExecResultF(this, (i) => i);
}

abstract class CopyWith$Fragment$ProcessExecResultF<TRes> {
  factory CopyWith$Fragment$ProcessExecResultF(
          Fragment$ProcessExecResultF instance,
          TRes Function(Fragment$ProcessExecResultF) then) =
      _CopyWithImpl$Fragment$ProcessExecResultF;

  factory CopyWith$Fragment$ProcessExecResultF.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ProcessExecResultF;

  TRes call(
      {int? exitCode,
      int? pid,
      String? stderr,
      String? stdout,
      String? $__typename});
}

class _CopyWithImpl$Fragment$ProcessExecResultF<TRes>
    implements CopyWith$Fragment$ProcessExecResultF<TRes> {
  _CopyWithImpl$Fragment$ProcessExecResultF(this._instance, this._then);

  final Fragment$ProcessExecResultF _instance;

  final TRes Function(Fragment$ProcessExecResultF) _then;

  static const _undefined = {};

  TRes call(
          {Object? exitCode = _undefined,
          Object? pid = _undefined,
          Object? stderr = _undefined,
          Object? stdout = _undefined,
          Object? $__typename = _undefined}) =>
      _then(Fragment$ProcessExecResultF(
          exitCode: exitCode == _undefined || exitCode == null
              ? _instance.exitCode
              : (exitCode as int),
          pid: pid == _undefined || pid == null ? _instance.pid : (pid as int),
          stderr: stderr == _undefined || stderr == null
              ? _instance.stderr
              : (stderr as String),
          stdout: stdout == _undefined || stdout == null
              ? _instance.stdout
              : (stdout as String),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$ProcessExecResultF<TRes>
    implements CopyWith$Fragment$ProcessExecResultF<TRes> {
  _CopyWithStubImpl$Fragment$ProcessExecResultF(this._res);

  TRes _res;

  call(
          {int? exitCode,
          int? pid,
          String? stderr,
          String? stdout,
          String? $__typename}) =>
      _res;
}

const fragmentDefinitionProcessExecResultF = FragmentDefinitionNode(
    name: NameNode(value: 'ProcessExecResultF'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
            name: NameNode(value: 'ProcessExecResult'), isNonNull: false)),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
          name: NameNode(value: 'exitCode'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'pid'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'stderr'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'stdout'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const documentNodeFragmentProcessExecResultF = DocumentNode(definitions: [
  fragmentDefinitionProcessExecResultF,
]);

extension ClientExtension$Fragment$ProcessExecResultF on graphql.GraphQLClient {
  void writeFragment$ProcessExecResultF(
          {required Fragment$ProcessExecResultF data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'ProcessExecResultF',
                  document: documentNodeFragmentProcessExecResultF)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$ProcessExecResultF? readFragment$ProcessExecResultF(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'ProcessExecResultF',
                document: documentNodeFragmentProcessExecResultF)),
        optimistic: optimistic);
    return result == null ? null : Fragment$ProcessExecResultF.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Query$topResult {
  Query$topResult({this.topOutput, required this.$__typename});

  @override
  factory Query$topResult.fromJson(Map<String, dynamic> json) =>
      _$Query$topResultFromJson(json);

  final String? topOutput;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Query$topResultToJson(this);
  int get hashCode {
    final l$topOutput = topOutput;
    final l$$__typename = $__typename;
    return Object.hashAll([l$topOutput, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Query$topResult) || runtimeType != other.runtimeType)
      return false;
    final l$topOutput = topOutput;
    final lOther$topOutput = other.topOutput;
    if (l$topOutput != lOther$topOutput) return false;
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Query$topResult on Query$topResult {
  CopyWith$Query$topResult<Query$topResult> get copyWith =>
      CopyWith$Query$topResult(this, (i) => i);
}

abstract class CopyWith$Query$topResult<TRes> {
  factory CopyWith$Query$topResult(
          Query$topResult instance, TRes Function(Query$topResult) then) =
      _CopyWithImpl$Query$topResult;

  factory CopyWith$Query$topResult.stub(TRes res) =
      _CopyWithStubImpl$Query$topResult;

  TRes call({String? topOutput, String? $__typename});
}

class _CopyWithImpl$Query$topResult<TRes>
    implements CopyWith$Query$topResult<TRes> {
  _CopyWithImpl$Query$topResult(this._instance, this._then);

  final Query$topResult _instance;

  final TRes Function(Query$topResult) _then;

  static const _undefined = {};

  TRes call(
          {Object? topOutput = _undefined, Object? $__typename = _undefined}) =>
      _then(Query$topResult(
          topOutput: topOutput == _undefined
              ? _instance.topOutput
              : (topOutput as String?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Query$topResult<TRes>
    implements CopyWith$Query$topResult<TRes> {
  _CopyWithStubImpl$Query$topResult(this._res);

  TRes _res;

  call({String? topOutput, String? $__typename}) => _res;
}

const documentNodeQuerytopResult = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'topResult'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'topOutput'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
]);
Query$topResult _parserFn$Query$topResult(Map<String, dynamic> data) =>
    Query$topResult.fromJson(data);

class Options$Query$topResult extends graphql.QueryOptions<Query$topResult> {
  Options$Query$topResult(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      Duration? pollInterval,
      graphql.Context? context})
      : super(
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            pollInterval: pollInterval,
            context: context,
            document: documentNodeQuerytopResult,
            parserFn: _parserFn$Query$topResult);
}

class WatchOptions$Query$topResult
    extends graphql.WatchQueryOptions<Query$topResult> {
  WatchOptions$Query$topResult(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      Duration? pollInterval,
      bool? eagerlyFetchResults,
      bool carryForwardDataOnException = true,
      bool fetchResults = false})
      : super(
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            document: documentNodeQuerytopResult,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Query$topResult);
}

class FetchMoreOptions$Query$topResult extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$topResult({required graphql.UpdateQuery updateQuery})
      : super(updateQuery: updateQuery, document: documentNodeQuerytopResult);
}

extension ClientExtension$Query$topResult on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$topResult>> query$topResult(
          [Options$Query$topResult? options]) async =>
      await this.query(options ?? Options$Query$topResult());
  graphql.ObservableQuery<Query$topResult> watchQuery$topResult(
          [WatchOptions$Query$topResult? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$topResult());
  void writeQuery$topResult(
          {required Query$topResult data, bool broadcast = true}) =>
      this.writeQuery(
          graphql.Request(
              operation:
                  graphql.Operation(document: documentNodeQuerytopResult)),
          data: data.toJson(),
          broadcast: broadcast);
  Query$topResult? readQuery$topResult({bool optimistic = true}) {
    final result = this.readQuery(
        graphql.Request(
            operation: graphql.Operation(document: documentNodeQuerytopResult)),
        optimistic: optimistic);
    return result == null ? null : Query$topResult.fromJson(result);
  }
}

@JsonSerializable(explicitToJson: true)
class Mutation$startService {
  Mutation$startService(
      {required this.startService, required this.$__typename});

  @override
  factory Mutation$startService.fromJson(Map<String, dynamic> json) =>
      _$Mutation$startServiceFromJson(json);

  final List<Fragment$CompilationLogF> startService;

  @JsonKey(name: '__typename')
  final String $__typename;

  Map<String, dynamic> toJson() => _$Mutation$startServiceToJson(this);
  int get hashCode {
    final l$startService = startService;
    final l$$__typename = $__typename;
    return Object.hashAll(
        [Object.hashAll(l$startService.map((v) => v)), l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (!(other is Mutation$startService) || runtimeType != other.runtimeType)
      return false;
    final l$startService = startService;
    final lOther$startService = other.startService;
    if (l$startService.length != lOther$startService.length) return false;
    for (int i = 0; i < l$startService.length; i++) {
      final l$startService$entry = l$startService[i];
      final lOther$startService$entry = lOther$startService[i];
      if (l$startService$entry != lOther$startService$entry) return false;
    }

    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) return false;
    return true;
  }
}

extension UtilityExtension$Mutation$startService on Mutation$startService {
  CopyWith$Mutation$startService<Mutation$startService> get copyWith =>
      CopyWith$Mutation$startService(this, (i) => i);
}

abstract class CopyWith$Mutation$startService<TRes> {
  factory CopyWith$Mutation$startService(Mutation$startService instance,
          TRes Function(Mutation$startService) then) =
      _CopyWithImpl$Mutation$startService;

  factory CopyWith$Mutation$startService.stub(TRes res) =
      _CopyWithStubImpl$Mutation$startService;

  TRes call(
      {List<Fragment$CompilationLogF>? startService, String? $__typename});
  TRes startService(
      Iterable<Fragment$CompilationLogF> Function(
              Iterable<
                  CopyWith$Fragment$CompilationLogF<Fragment$CompilationLogF>>)
          _fn);
}

class _CopyWithImpl$Mutation$startService<TRes>
    implements CopyWith$Mutation$startService<TRes> {
  _CopyWithImpl$Mutation$startService(this._instance, this._then);

  final Mutation$startService _instance;

  final TRes Function(Mutation$startService) _then;

  static const _undefined = {};

  TRes call(
          {Object? startService = _undefined,
          Object? $__typename = _undefined}) =>
      _then(Mutation$startService(
          startService: startService == _undefined || startService == null
              ? _instance.startService
              : (startService as List<Fragment$CompilationLogF>),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
  TRes startService(
          Iterable<Fragment$CompilationLogF> Function(
                  Iterable<
                      CopyWith$Fragment$CompilationLogF<
                          Fragment$CompilationLogF>>)
              _fn) =>
      call(
          startService: _fn(_instance.startService
                  .map((e) => CopyWith$Fragment$CompilationLogF(e, (i) => i)))
              .toList());
}

class _CopyWithStubImpl$Mutation$startService<TRes>
    implements CopyWith$Mutation$startService<TRes> {
  _CopyWithStubImpl$Mutation$startService(this._res);

  TRes _res;

  call({List<Fragment$CompilationLogF>? startService, String? $__typename}) =>
      _res;
  startService(_fn) => _res;
}

const documentNodeMutationstartService = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'startService'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'startService'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'CompilationLogF'), directives: []),
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  fragmentDefinitionCompilationLogF,
  fragmentDefinitionProcessExecResultF,
]);
Mutation$startService _parserFn$Mutation$startService(
        Map<String, dynamic> data) =>
    Mutation$startService.fromJson(data);
typedef OnMutationCompleted$Mutation$startService = FutureOr<void> Function(
    dynamic, Mutation$startService?);

class Options$Mutation$startService
    extends graphql.MutationOptions<Mutation$startService> {
  Options$Mutation$startService(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      OnMutationCompleted$Mutation$startService? onCompleted,
      graphql.OnMutationUpdate<Mutation$startService>? update,
      graphql.OnError? onError})
      : onCompletedWithParsed = onCompleted,
        super(
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            onCompleted: onCompleted == null
                ? null
                : (data) => onCompleted(
                    data,
                    data == null
                        ? null
                        : _parserFn$Mutation$startService(data)),
            update: update,
            onError: onError,
            document: documentNodeMutationstartService,
            parserFn: _parserFn$Mutation$startService);

  final OnMutationCompleted$Mutation$startService? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed
      ];
}

class WatchOptions$Mutation$startService
    extends graphql.WatchQueryOptions<Mutation$startService> {
  WatchOptions$Mutation$startService(
      {String? operationName,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context,
      Duration? pollInterval,
      bool? eagerlyFetchResults,
      bool carryForwardDataOnException = true,
      bool fetchResults = false})
      : super(
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            document: documentNodeMutationstartService,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Mutation$startService);
}

extension ClientExtension$Mutation$startService on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$startService>> mutate$startService(
          [Options$Mutation$startService? options]) async =>
      await this.mutate(options ?? Options$Mutation$startService());
  graphql.ObservableQuery<Mutation$startService> watchMutation$startService(
          [WatchOptions$Mutation$startService? options]) =>
      this.watchMutation(options ?? WatchOptions$Mutation$startService());
}
