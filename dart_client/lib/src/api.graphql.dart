import '../schema.graphql.dart';
import 'dart:async';
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;

class Fragment$CompilationLogF {
  Fragment$CompilationLogF(
      {required this.message,
      required this.time,
      this.command,
      required this.$__typename});

  factory Fragment$CompilationLogF.fromJson(Map<String, dynamic> json) {
    final l$message = json['message'];
    final l$time = json['time'];
    final l$command = json['command'];
    final l$$__typename = json['__typename'];
    return Fragment$CompilationLogF(
        message: (l$message as String),
        time: DateTime.parse((l$time as String)),
        command: l$command == null
            ? null
            : Fragment$CommandExecutionF.fromJson(
                (l$command as Map<String, dynamic>)),
        $__typename: (l$$__typename as String));
  }

  final String message;

  final DateTime time;

  final Fragment$CommandExecutionF? command;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$message = message;
    _resultData['message'] = l$message;
    final l$time = time;
    _resultData['time'] = l$time.toIso8601String();
    final l$command = command;
    _resultData['command'] = l$command?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$message = message;
    final l$time = time;
    final l$command = command;
    final l$$__typename = $__typename;
    return Object.hashAll([l$message, l$time, l$command, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$CompilationLogF) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
      return false;
    }
    final l$time = time;
    final lOther$time = other.time;
    if (l$time != lOther$time) {
      return false;
    }
    final l$command = command;
    final lOther$command = other.command;
    if (l$command != lOther$command) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
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
      Fragment$CommandExecutionF? command,
      String? $__typename});
  CopyWith$Fragment$CommandExecutionF<TRes> get command;
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
              : (command as Fragment$CommandExecutionF?),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
  CopyWith$Fragment$CommandExecutionF<TRes> get command {
    final local$command = _instance.command;
    return local$command == null
        ? CopyWith$Fragment$CommandExecutionF.stub(_then(_instance))
        : CopyWith$Fragment$CommandExecutionF(
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
          Fragment$CommandExecutionF? command,
          String? $__typename}) =>
      _res;
  CopyWith$Fragment$CommandExecutionF<TRes> get command =>
      CopyWith$Fragment$CommandExecutionF.stub(_res);
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
            FragmentSpreadNode(
                name: NameNode(value: 'CommandExecutionF'), directives: []),
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
  fragmentDefinitionCommandExecutionF,
  fragmentDefinitionCliCommandF,
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

class Fragment$CommandExecutionF {
  Fragment$CommandExecutionF(
      {required this.command,
      required this.status,
      this.durationMs,
      this.endTime,
      this.result,
      required this.$__typename});

  factory Fragment$CommandExecutionF.fromJson(Map<String, dynamic> json) {
    final l$command = json['command'];
    final l$status = json['status'];
    final l$durationMs = json['durationMs'];
    final l$endTime = json['endTime'];
    final l$result = json['result'];
    final l$$__typename = json['__typename'];
    return Fragment$CommandExecutionF(
        command:
            Fragment$CliCommandF.fromJson((l$command as Map<String, dynamic>)),
        status: fromJson$Enum$CompilationStatus((l$status as String)),
        durationMs: (l$durationMs as int?),
        endTime:
            l$endTime == null ? null : DateTime.parse((l$endTime as String)),
        result: l$result == null
            ? null
            : Fragment$ProcessExecResultF.fromJson(
                (l$result as Map<String, dynamic>)),
        $__typename: (l$$__typename as String));
  }

  final Fragment$CliCommandF command;

  final Enum$CompilationStatus status;

  final int? durationMs;

  final DateTime? endTime;

  final Fragment$ProcessExecResultF? result;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$command = command;
    _resultData['command'] = l$command.toJson();
    final l$status = status;
    _resultData['status'] = toJson$Enum$CompilationStatus(l$status);
    final l$durationMs = durationMs;
    _resultData['durationMs'] = l$durationMs;
    final l$endTime = endTime;
    _resultData['endTime'] = l$endTime?.toIso8601String();
    final l$result = result;
    _resultData['result'] = l$result?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
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
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$CommandExecutionF) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$command = command;
    final lOther$command = other.command;
    if (l$command != lOther$command) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$durationMs = durationMs;
    final lOther$durationMs = other.durationMs;
    if (l$durationMs != lOther$durationMs) {
      return false;
    }
    final l$endTime = endTime;
    final lOther$endTime = other.endTime;
    if (l$endTime != lOther$endTime) {
      return false;
    }
    final l$result = result;
    final lOther$result = other.result;
    if (l$result != lOther$result) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
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
      {Fragment$CliCommandF? command,
      Enum$CompilationStatus? status,
      int? durationMs,
      DateTime? endTime,
      Fragment$ProcessExecResultF? result,
      String? $__typename});
  CopyWith$Fragment$CliCommandF<TRes> get command;
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
              : (command as Fragment$CliCommandF),
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
  CopyWith$Fragment$CliCommandF<TRes> get command {
    final local$command = _instance.command;
    return CopyWith$Fragment$CliCommandF(
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
          {Fragment$CliCommandF? command,
          Enum$CompilationStatus? status,
          int? durationMs,
          DateTime? endTime,
          Fragment$ProcessExecResultF? result,
          String? $__typename}) =>
      _res;
  CopyWith$Fragment$CliCommandF<TRes> get command =>
      CopyWith$Fragment$CliCommandF.stub(_res);
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
            FragmentSpreadNode(
                name: NameNode(value: 'CliCommandF'), directives: []),
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
  fragmentDefinitionCliCommandF,
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

class Fragment$ProcessExecResultF {
  Fragment$ProcessExecResultF(
      {required this.exitCode,
      required this.pid,
      required this.stderr,
      required this.stdout,
      required this.$__typename});

  factory Fragment$ProcessExecResultF.fromJson(Map<String, dynamic> json) {
    final l$exitCode = json['exitCode'];
    final l$pid = json['pid'];
    final l$stderr = json['stderr'];
    final l$stdout = json['stdout'];
    final l$$__typename = json['__typename'];
    return Fragment$ProcessExecResultF(
        exitCode: (l$exitCode as int),
        pid: (l$pid as int),
        stderr: (l$stderr as String),
        stdout: (l$stdout as String),
        $__typename: (l$$__typename as String));
  }

  final int exitCode;

  final int pid;

  final String stderr;

  final String stdout;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$exitCode = exitCode;
    _resultData['exitCode'] = l$exitCode;
    final l$pid = pid;
    _resultData['pid'] = l$pid;
    final l$stderr = stderr;
    _resultData['stderr'] = l$stderr;
    final l$stdout = stdout;
    _resultData['stdout'] = l$stdout;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
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
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ProcessExecResultF) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$exitCode = exitCode;
    final lOther$exitCode = other.exitCode;
    if (l$exitCode != lOther$exitCode) {
      return false;
    }
    final l$pid = pid;
    final lOther$pid = other.pid;
    if (l$pid != lOther$pid) {
      return false;
    }
    final l$stderr = stderr;
    final lOther$stderr = other.stderr;
    if (l$stderr != lOther$stderr) {
      return false;
    }
    final l$stdout = stdout;
    final lOther$stdout = other.stdout;
    if (l$stdout != lOther$stdout) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
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

class Fragment$CompilationEventF {
  Fragment$CompilationEventF({required this.$__typename});

  factory Fragment$CompilationEventF.fromJson(Map<String, dynamic> json) {
    switch (json["__typename"] as String) {
      case "CompilationEventCompilation":
        return Fragment$CompilationEventF$$CompilationEventCompilation.fromJson(
            json);

      case "CompilationEventCreated":
        return Fragment$CompilationEventF$$CompilationEventCreated.fromJson(
            json);

      case "CompilationEventCreationError":
        return Fragment$CompilationEventF$$CompilationEventCreationError
            .fromJson(json);

      case "CompilationEventExecution":
        return Fragment$CompilationEventF$$CompilationEventExecution.fromJson(
            json);

      case "CompilationEventPartialExecution":
        return Fragment$CompilationEventF$$CompilationEventPartialExecution
            .fromJson(json);

      case "CompilationEventLog":
        return Fragment$CompilationEventF$$CompilationEventLog.fromJson(json);

      default:
        final l$$__typename = json['__typename'];
        return Fragment$CompilationEventF(
            $__typename: (l$$__typename as String));
    }
  }

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    return Object.hashAll([l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$CompilationEventF) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$CompilationEventF
    on Fragment$CompilationEventF {
  CopyWith$Fragment$CompilationEventF<Fragment$CompilationEventF>
      get copyWith => CopyWith$Fragment$CompilationEventF(this, (i) => i);
}

abstract class CopyWith$Fragment$CompilationEventF<TRes> {
  factory CopyWith$Fragment$CompilationEventF(
          Fragment$CompilationEventF instance,
          TRes Function(Fragment$CompilationEventF) then) =
      _CopyWithImpl$Fragment$CompilationEventF;

  factory CopyWith$Fragment$CompilationEventF.stub(TRes res) =
      _CopyWithStubImpl$Fragment$CompilationEventF;

  TRes call({String? $__typename});
}

class _CopyWithImpl$Fragment$CompilationEventF<TRes>
    implements CopyWith$Fragment$CompilationEventF<TRes> {
  _CopyWithImpl$Fragment$CompilationEventF(this._instance, this._then);

  final Fragment$CompilationEventF _instance;

  final TRes Function(Fragment$CompilationEventF) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined}) => _then(
      Fragment$CompilationEventF(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$CompilationEventF<TRes>
    implements CopyWith$Fragment$CompilationEventF<TRes> {
  _CopyWithStubImpl$Fragment$CompilationEventF(this._res);

  TRes _res;

  call({String? $__typename}) => _res;
}

const fragmentDefinitionCompilationEventF = FragmentDefinitionNode(
    name: NameNode(value: 'CompilationEventF'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
            name: NameNode(value: 'CompilationEvent'), isNonNull: false)),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      InlineFragmentNode(
          typeCondition: TypeConditionNode(
              on: NamedTypeNode(
                  name: NameNode(value: 'CompilationEventCompilation'),
                  isNonNull: false)),
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
                name: NameNode(value: 'compilation'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                      name: NameNode(value: 'CompilationF'), directives: []),
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
      InlineFragmentNode(
          typeCondition: TypeConditionNode(
              on: NamedTypeNode(
                  name: NameNode(value: 'CompilationEventCreated'),
                  isNonNull: false)),
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
                name: NameNode(value: 'service'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                      name: NameNode(value: 'ServiceConfigF'), directives: []),
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
      InlineFragmentNode(
          typeCondition: TypeConditionNode(
              on: NamedTypeNode(
                  name: NameNode(value: 'CompilationEventCreationError'),
                  isNonNull: false)),
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
                name: NameNode(value: 'message'),
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
      InlineFragmentNode(
          typeCondition: TypeConditionNode(
              on: NamedTypeNode(
                  name: NameNode(value: 'CompilationEventExecution'),
                  isNonNull: false)),
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
                name: NameNode(value: 'logIndex'),
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
                  FragmentSpreadNode(
                      name: NameNode(value: 'CommandExecutionF'),
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
      InlineFragmentNode(
          typeCondition: TypeConditionNode(
              on: NamedTypeNode(
                  name: NameNode(value: 'CompilationEventPartialExecution'),
                  isNonNull: false)),
          directives: [],
          selectionSet: SelectionSetNode(selections: [
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
          ])),
      InlineFragmentNode(
          typeCondition: TypeConditionNode(
              on: NamedTypeNode(
                  name: NameNode(value: 'CompilationEventLog'),
                  isNonNull: false)),
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
                name: NameNode(value: 'log'),
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
          ]))
    ]));
const documentNodeFragmentCompilationEventF = DocumentNode(definitions: [
  fragmentDefinitionCompilationEventF,
  fragmentDefinitionCompilationF,
  fragmentDefinitionCompilationLogF,
  fragmentDefinitionCommandExecutionF,
  fragmentDefinitionCliCommandF,
  fragmentDefinitionProcessExecResultF,
  fragmentDefinitionServiceConfigF,
]);

extension ClientExtension$Fragment$CompilationEventF on graphql.GraphQLClient {
  void writeFragment$CompilationEventF(
          {required Fragment$CompilationEventF data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'CompilationEventF',
                  document: documentNodeFragmentCompilationEventF)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$CompilationEventF? readFragment$CompilationEventF(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'CompilationEventF',
                document: documentNodeFragmentCompilationEventF)),
        optimistic: optimistic);
    return result == null ? null : Fragment$CompilationEventF.fromJson(result);
  }
}

class Fragment$CompilationEventF$$CompilationEventCompilation
    implements Fragment$CompilationEventF {
  Fragment$CompilationEventF$$CompilationEventCompilation(
      {required this.$__typename, required this.compilation});

  factory Fragment$CompilationEventF$$CompilationEventCompilation.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$compilation = json['compilation'];
    return Fragment$CompilationEventF$$CompilationEventCompilation(
        $__typename: (l$$__typename as String),
        compilation: Fragment$CompilationF.fromJson(
            (l$compilation as Map<String, dynamic>)));
  }

  final String $__typename;

  final Fragment$CompilationF compilation;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$compilation = compilation;
    _resultData['compilation'] = l$compilation.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$compilation = compilation;
    return Object.hashAll([l$$__typename, l$compilation]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$CompilationEventF$$CompilationEventCompilation) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$compilation = compilation;
    final lOther$compilation = other.compilation;
    if (l$compilation != lOther$compilation) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$CompilationEventF$$CompilationEventCompilation
    on Fragment$CompilationEventF$$CompilationEventCompilation {
  CopyWith$Fragment$CompilationEventF$$CompilationEventCompilation<
          Fragment$CompilationEventF$$CompilationEventCompilation>
      get copyWith =>
          CopyWith$Fragment$CompilationEventF$$CompilationEventCompilation(
              this, (i) => i);
}

abstract class CopyWith$Fragment$CompilationEventF$$CompilationEventCompilation<
    TRes> {
  factory CopyWith$Fragment$CompilationEventF$$CompilationEventCompilation(
          Fragment$CompilationEventF$$CompilationEventCompilation instance,
          TRes Function(Fragment$CompilationEventF$$CompilationEventCompilation)
              then) =
      _CopyWithImpl$Fragment$CompilationEventF$$CompilationEventCompilation;

  factory CopyWith$Fragment$CompilationEventF$$CompilationEventCompilation.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$CompilationEventF$$CompilationEventCompilation;

  TRes call({String? $__typename, Fragment$CompilationF? compilation});
  CopyWith$Fragment$CompilationF<TRes> get compilation;
}

class _CopyWithImpl$Fragment$CompilationEventF$$CompilationEventCompilation<
        TRes>
    implements
        CopyWith$Fragment$CompilationEventF$$CompilationEventCompilation<TRes> {
  _CopyWithImpl$Fragment$CompilationEventF$$CompilationEventCompilation(
      this._instance, this._then);

  final Fragment$CompilationEventF$$CompilationEventCompilation _instance;

  final TRes Function(Fragment$CompilationEventF$$CompilationEventCompilation)
      _then;

  static const _undefined = {};

  TRes call(
          {Object? $__typename = _undefined,
          Object? compilation = _undefined}) =>
      _then(Fragment$CompilationEventF$$CompilationEventCompilation(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
          compilation: compilation == _undefined || compilation == null
              ? _instance.compilation
              : (compilation as Fragment$CompilationF)));
  CopyWith$Fragment$CompilationF<TRes> get compilation {
    final local$compilation = _instance.compilation;
    return CopyWith$Fragment$CompilationF(
        local$compilation, (e) => call(compilation: e));
  }
}

class _CopyWithStubImpl$Fragment$CompilationEventF$$CompilationEventCompilation<
        TRes>
    implements
        CopyWith$Fragment$CompilationEventF$$CompilationEventCompilation<TRes> {
  _CopyWithStubImpl$Fragment$CompilationEventF$$CompilationEventCompilation(
      this._res);

  TRes _res;

  call({String? $__typename, Fragment$CompilationF? compilation}) => _res;
  CopyWith$Fragment$CompilationF<TRes> get compilation =>
      CopyWith$Fragment$CompilationF.stub(_res);
}

class Fragment$CompilationEventF$$CompilationEventCreated
    implements Fragment$CompilationEventF {
  Fragment$CompilationEventF$$CompilationEventCreated(
      {required this.$__typename, required this.service});

  factory Fragment$CompilationEventF$$CompilationEventCreated.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$service = json['service'];
    return Fragment$CompilationEventF$$CompilationEventCreated(
        $__typename: (l$$__typename as String),
        service: Fragment$ServiceConfigF.fromJson(
            (l$service as Map<String, dynamic>)));
  }

  final String $__typename;

  final Fragment$ServiceConfigF service;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$service = service;
    _resultData['service'] = l$service.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$service = service;
    return Object.hashAll([l$$__typename, l$service]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$CompilationEventF$$CompilationEventCreated) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$service = service;
    final lOther$service = other.service;
    if (l$service != lOther$service) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$CompilationEventF$$CompilationEventCreated
    on Fragment$CompilationEventF$$CompilationEventCreated {
  CopyWith$Fragment$CompilationEventF$$CompilationEventCreated<
          Fragment$CompilationEventF$$CompilationEventCreated>
      get copyWith =>
          CopyWith$Fragment$CompilationEventF$$CompilationEventCreated(
              this, (i) => i);
}

abstract class CopyWith$Fragment$CompilationEventF$$CompilationEventCreated<
    TRes> {
  factory CopyWith$Fragment$CompilationEventF$$CompilationEventCreated(
          Fragment$CompilationEventF$$CompilationEventCreated instance,
          TRes Function(Fragment$CompilationEventF$$CompilationEventCreated)
              then) =
      _CopyWithImpl$Fragment$CompilationEventF$$CompilationEventCreated;

  factory CopyWith$Fragment$CompilationEventF$$CompilationEventCreated.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$CompilationEventF$$CompilationEventCreated;

  TRes call({String? $__typename, Fragment$ServiceConfigF? service});
  CopyWith$Fragment$ServiceConfigF<TRes> get service;
}

class _CopyWithImpl$Fragment$CompilationEventF$$CompilationEventCreated<TRes>
    implements
        CopyWith$Fragment$CompilationEventF$$CompilationEventCreated<TRes> {
  _CopyWithImpl$Fragment$CompilationEventF$$CompilationEventCreated(
      this._instance, this._then);

  final Fragment$CompilationEventF$$CompilationEventCreated _instance;

  final TRes Function(Fragment$CompilationEventF$$CompilationEventCreated)
      _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined, Object? service = _undefined}) =>
      _then(Fragment$CompilationEventF$$CompilationEventCreated(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
          service: service == _undefined || service == null
              ? _instance.service
              : (service as Fragment$ServiceConfigF)));
  CopyWith$Fragment$ServiceConfigF<TRes> get service {
    final local$service = _instance.service;
    return CopyWith$Fragment$ServiceConfigF(
        local$service, (e) => call(service: e));
  }
}

class _CopyWithStubImpl$Fragment$CompilationEventF$$CompilationEventCreated<
        TRes>
    implements
        CopyWith$Fragment$CompilationEventF$$CompilationEventCreated<TRes> {
  _CopyWithStubImpl$Fragment$CompilationEventF$$CompilationEventCreated(
      this._res);

  TRes _res;

  call({String? $__typename, Fragment$ServiceConfigF? service}) => _res;
  CopyWith$Fragment$ServiceConfigF<TRes> get service =>
      CopyWith$Fragment$ServiceConfigF.stub(_res);
}

class Fragment$CompilationEventF$$CompilationEventCreationError
    implements Fragment$CompilationEventF {
  Fragment$CompilationEventF$$CompilationEventCreationError(
      {required this.$__typename, required this.message});

  factory Fragment$CompilationEventF$$CompilationEventCreationError.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$message = json['message'];
    return Fragment$CompilationEventF$$CompilationEventCreationError(
        $__typename: (l$$__typename as String), message: (l$message as String));
  }

  final String $__typename;

  final String message;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$message = message;
    return Object.hashAll([l$$__typename, l$message]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$CompilationEventF$$CompilationEventCreationError) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$CompilationEventF$$CompilationEventCreationError
    on Fragment$CompilationEventF$$CompilationEventCreationError {
  CopyWith$Fragment$CompilationEventF$$CompilationEventCreationError<
          Fragment$CompilationEventF$$CompilationEventCreationError>
      get copyWith =>
          CopyWith$Fragment$CompilationEventF$$CompilationEventCreationError(
              this, (i) => i);
}

abstract class CopyWith$Fragment$CompilationEventF$$CompilationEventCreationError<
    TRes> {
  factory CopyWith$Fragment$CompilationEventF$$CompilationEventCreationError(
          Fragment$CompilationEventF$$CompilationEventCreationError instance,
          TRes Function(
                  Fragment$CompilationEventF$$CompilationEventCreationError)
              then) =
      _CopyWithImpl$Fragment$CompilationEventF$$CompilationEventCreationError;

  factory CopyWith$Fragment$CompilationEventF$$CompilationEventCreationError.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$CompilationEventF$$CompilationEventCreationError;

  TRes call({String? $__typename, String? message});
}

class _CopyWithImpl$Fragment$CompilationEventF$$CompilationEventCreationError<
        TRes>
    implements
        CopyWith$Fragment$CompilationEventF$$CompilationEventCreationError<
            TRes> {
  _CopyWithImpl$Fragment$CompilationEventF$$CompilationEventCreationError(
      this._instance, this._then);

  final Fragment$CompilationEventF$$CompilationEventCreationError _instance;

  final TRes Function(Fragment$CompilationEventF$$CompilationEventCreationError)
      _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined, Object? message = _undefined}) =>
      _then(Fragment$CompilationEventF$$CompilationEventCreationError(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
          message: message == _undefined || message == null
              ? _instance.message
              : (message as String)));
}

class _CopyWithStubImpl$Fragment$CompilationEventF$$CompilationEventCreationError<
        TRes>
    implements
        CopyWith$Fragment$CompilationEventF$$CompilationEventCreationError<
            TRes> {
  _CopyWithStubImpl$Fragment$CompilationEventF$$CompilationEventCreationError(
      this._res);

  TRes _res;

  call({String? $__typename, String? message}) => _res;
}

class Fragment$CompilationEventF$$CompilationEventExecution
    implements Fragment$CompilationEventF {
  Fragment$CompilationEventF$$CompilationEventExecution(
      {required this.$__typename,
      required this.logIndex,
      required this.command});

  factory Fragment$CompilationEventF$$CompilationEventExecution.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$logIndex = json['logIndex'];
    final l$command = json['command'];
    return Fragment$CompilationEventF$$CompilationEventExecution(
        $__typename: (l$$__typename as String),
        logIndex: (l$logIndex as int),
        command: Fragment$CommandExecutionF.fromJson(
            (l$command as Map<String, dynamic>)));
  }

  final String $__typename;

  final int logIndex;

  final Fragment$CommandExecutionF command;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$logIndex = logIndex;
    _resultData['logIndex'] = l$logIndex;
    final l$command = command;
    _resultData['command'] = l$command.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$logIndex = logIndex;
    final l$command = command;
    return Object.hashAll([l$$__typename, l$logIndex, l$command]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$CompilationEventF$$CompilationEventExecution) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$logIndex = logIndex;
    final lOther$logIndex = other.logIndex;
    if (l$logIndex != lOther$logIndex) {
      return false;
    }
    final l$command = command;
    final lOther$command = other.command;
    if (l$command != lOther$command) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$CompilationEventF$$CompilationEventExecution
    on Fragment$CompilationEventF$$CompilationEventExecution {
  CopyWith$Fragment$CompilationEventF$$CompilationEventExecution<
          Fragment$CompilationEventF$$CompilationEventExecution>
      get copyWith =>
          CopyWith$Fragment$CompilationEventF$$CompilationEventExecution(
              this, (i) => i);
}

abstract class CopyWith$Fragment$CompilationEventF$$CompilationEventExecution<
    TRes> {
  factory CopyWith$Fragment$CompilationEventF$$CompilationEventExecution(
          Fragment$CompilationEventF$$CompilationEventExecution instance,
          TRes Function(Fragment$CompilationEventF$$CompilationEventExecution)
              then) =
      _CopyWithImpl$Fragment$CompilationEventF$$CompilationEventExecution;

  factory CopyWith$Fragment$CompilationEventF$$CompilationEventExecution.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$CompilationEventF$$CompilationEventExecution;

  TRes call(
      {String? $__typename,
      int? logIndex,
      Fragment$CommandExecutionF? command});
  CopyWith$Fragment$CommandExecutionF<TRes> get command;
}

class _CopyWithImpl$Fragment$CompilationEventF$$CompilationEventExecution<TRes>
    implements
        CopyWith$Fragment$CompilationEventF$$CompilationEventExecution<TRes> {
  _CopyWithImpl$Fragment$CompilationEventF$$CompilationEventExecution(
      this._instance, this._then);

  final Fragment$CompilationEventF$$CompilationEventExecution _instance;

  final TRes Function(Fragment$CompilationEventF$$CompilationEventExecution)
      _then;

  static const _undefined = {};

  TRes call(
          {Object? $__typename = _undefined,
          Object? logIndex = _undefined,
          Object? command = _undefined}) =>
      _then(Fragment$CompilationEventF$$CompilationEventExecution(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
          logIndex: logIndex == _undefined || logIndex == null
              ? _instance.logIndex
              : (logIndex as int),
          command: command == _undefined || command == null
              ? _instance.command
              : (command as Fragment$CommandExecutionF)));
  CopyWith$Fragment$CommandExecutionF<TRes> get command {
    final local$command = _instance.command;
    return CopyWith$Fragment$CommandExecutionF(
        local$command, (e) => call(command: e));
  }
}

class _CopyWithStubImpl$Fragment$CompilationEventF$$CompilationEventExecution<
        TRes>
    implements
        CopyWith$Fragment$CompilationEventF$$CompilationEventExecution<TRes> {
  _CopyWithStubImpl$Fragment$CompilationEventF$$CompilationEventExecution(
      this._res);

  TRes _res;

  call(
          {String? $__typename,
          int? logIndex,
          Fragment$CommandExecutionF? command}) =>
      _res;
  CopyWith$Fragment$CommandExecutionF<TRes> get command =>
      CopyWith$Fragment$CommandExecutionF.stub(_res);
}

class Fragment$CompilationEventF$$CompilationEventPartialExecution
    implements Fragment$CompilationEventF {
  Fragment$CompilationEventF$$CompilationEventPartialExecution(
      {required this.$__typename, required this.stderr, required this.stdout});

  factory Fragment$CompilationEventF$$CompilationEventPartialExecution.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$stderr = json['stderr'];
    final l$stdout = json['stdout'];
    return Fragment$CompilationEventF$$CompilationEventPartialExecution(
        $__typename: (l$$__typename as String),
        stderr: (l$stderr as List<dynamic>).map((e) => (e as String)).toList(),
        stdout: (l$stdout as List<dynamic>).map((e) => (e as String)).toList());
  }

  final String $__typename;

  final List<String> stderr;

  final List<String> stdout;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$stderr = stderr;
    _resultData['stderr'] = l$stderr.map((e) => e).toList();
    final l$stdout = stdout;
    _resultData['stdout'] = l$stdout.map((e) => e).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$stderr = stderr;
    final l$stdout = stdout;
    return Object.hashAll([
      l$$__typename,
      Object.hashAll(l$stderr.map((v) => v)),
      Object.hashAll(l$stdout.map((v) => v))
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other
            is Fragment$CompilationEventF$$CompilationEventPartialExecution) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$stderr = stderr;
    final lOther$stderr = other.stderr;
    if (l$stderr.length != lOther$stderr.length) {
      return false;
    }
    for (int i = 0; i < l$stderr.length; i++) {
      final l$stderr$entry = l$stderr[i];
      final lOther$stderr$entry = lOther$stderr[i];
      if (l$stderr$entry != lOther$stderr$entry) {
        return false;
      }
    }
    final l$stdout = stdout;
    final lOther$stdout = other.stdout;
    if (l$stdout.length != lOther$stdout.length) {
      return false;
    }
    for (int i = 0; i < l$stdout.length; i++) {
      final l$stdout$entry = l$stdout[i];
      final lOther$stdout$entry = lOther$stdout[i];
      if (l$stdout$entry != lOther$stdout$entry) {
        return false;
      }
    }
    return true;
  }
}

extension UtilityExtension$Fragment$CompilationEventF$$CompilationEventPartialExecution
    on Fragment$CompilationEventF$$CompilationEventPartialExecution {
  CopyWith$Fragment$CompilationEventF$$CompilationEventPartialExecution<
          Fragment$CompilationEventF$$CompilationEventPartialExecution>
      get copyWith =>
          CopyWith$Fragment$CompilationEventF$$CompilationEventPartialExecution(
              this, (i) => i);
}

abstract class CopyWith$Fragment$CompilationEventF$$CompilationEventPartialExecution<
    TRes> {
  factory CopyWith$Fragment$CompilationEventF$$CompilationEventPartialExecution(
          Fragment$CompilationEventF$$CompilationEventPartialExecution instance,
          TRes Function(
                  Fragment$CompilationEventF$$CompilationEventPartialExecution)
              then) =
      _CopyWithImpl$Fragment$CompilationEventF$$CompilationEventPartialExecution;

  factory CopyWith$Fragment$CompilationEventF$$CompilationEventPartialExecution.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$CompilationEventF$$CompilationEventPartialExecution;

  TRes call({String? $__typename, List<String>? stderr, List<String>? stdout});
}

class _CopyWithImpl$Fragment$CompilationEventF$$CompilationEventPartialExecution<
        TRes>
    implements
        CopyWith$Fragment$CompilationEventF$$CompilationEventPartialExecution<
            TRes> {
  _CopyWithImpl$Fragment$CompilationEventF$$CompilationEventPartialExecution(
      this._instance, this._then);

  final Fragment$CompilationEventF$$CompilationEventPartialExecution _instance;

  final TRes Function(
      Fragment$CompilationEventF$$CompilationEventPartialExecution) _then;

  static const _undefined = {};

  TRes call(
          {Object? $__typename = _undefined,
          Object? stderr = _undefined,
          Object? stdout = _undefined}) =>
      _then(Fragment$CompilationEventF$$CompilationEventPartialExecution(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
          stderr: stderr == _undefined || stderr == null
              ? _instance.stderr
              : (stderr as List<String>),
          stdout: stdout == _undefined || stdout == null
              ? _instance.stdout
              : (stdout as List<String>)));
}

class _CopyWithStubImpl$Fragment$CompilationEventF$$CompilationEventPartialExecution<
        TRes>
    implements
        CopyWith$Fragment$CompilationEventF$$CompilationEventPartialExecution<
            TRes> {
  _CopyWithStubImpl$Fragment$CompilationEventF$$CompilationEventPartialExecution(
      this._res);

  TRes _res;

  call({String? $__typename, List<String>? stderr, List<String>? stdout}) =>
      _res;
}

class Fragment$CompilationEventF$$CompilationEventLog
    implements Fragment$CompilationEventF {
  Fragment$CompilationEventF$$CompilationEventLog(
      {required this.$__typename, required this.log});

  factory Fragment$CompilationEventF$$CompilationEventLog.fromJson(
      Map<String, dynamic> json) {
    final l$$__typename = json['__typename'];
    final l$log = json['log'];
    return Fragment$CompilationEventF$$CompilationEventLog(
        $__typename: (l$$__typename as String),
        log:
            Fragment$CompilationLogF.fromJson((l$log as Map<String, dynamic>)));
  }

  final String $__typename;

  final Fragment$CompilationLogF log;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$log = log;
    _resultData['log'] = l$log.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$$__typename = $__typename;
    final l$log = log;
    return Object.hashAll([l$$__typename, l$log]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$CompilationEventF$$CompilationEventLog) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    final l$log = log;
    final lOther$log = other.log;
    if (l$log != lOther$log) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$CompilationEventF$$CompilationEventLog
    on Fragment$CompilationEventF$$CompilationEventLog {
  CopyWith$Fragment$CompilationEventF$$CompilationEventLog<
          Fragment$CompilationEventF$$CompilationEventLog>
      get copyWith => CopyWith$Fragment$CompilationEventF$$CompilationEventLog(
          this, (i) => i);
}

abstract class CopyWith$Fragment$CompilationEventF$$CompilationEventLog<TRes> {
  factory CopyWith$Fragment$CompilationEventF$$CompilationEventLog(
          Fragment$CompilationEventF$$CompilationEventLog instance,
          TRes Function(Fragment$CompilationEventF$$CompilationEventLog) then) =
      _CopyWithImpl$Fragment$CompilationEventF$$CompilationEventLog;

  factory CopyWith$Fragment$CompilationEventF$$CompilationEventLog.stub(
          TRes res) =
      _CopyWithStubImpl$Fragment$CompilationEventF$$CompilationEventLog;

  TRes call({String? $__typename, Fragment$CompilationLogF? log});
  CopyWith$Fragment$CompilationLogF<TRes> get log;
}

class _CopyWithImpl$Fragment$CompilationEventF$$CompilationEventLog<TRes>
    implements CopyWith$Fragment$CompilationEventF$$CompilationEventLog<TRes> {
  _CopyWithImpl$Fragment$CompilationEventF$$CompilationEventLog(
      this._instance, this._then);

  final Fragment$CompilationEventF$$CompilationEventLog _instance;

  final TRes Function(Fragment$CompilationEventF$$CompilationEventLog) _then;

  static const _undefined = {};

  TRes call({Object? $__typename = _undefined, Object? log = _undefined}) =>
      _then(Fragment$CompilationEventF$$CompilationEventLog(
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String),
          log: log == _undefined || log == null
              ? _instance.log
              : (log as Fragment$CompilationLogF)));
  CopyWith$Fragment$CompilationLogF<TRes> get log {
    final local$log = _instance.log;
    return CopyWith$Fragment$CompilationLogF(local$log, (e) => call(log: e));
  }
}

class _CopyWithStubImpl$Fragment$CompilationEventF$$CompilationEventLog<TRes>
    implements CopyWith$Fragment$CompilationEventF$$CompilationEventLog<TRes> {
  _CopyWithStubImpl$Fragment$CompilationEventF$$CompilationEventLog(this._res);

  TRes _res;

  call({String? $__typename, Fragment$CompilationLogF? log}) => _res;
  CopyWith$Fragment$CompilationLogF<TRes> get log =>
      CopyWith$Fragment$CompilationLogF.stub(_res);
}

class Fragment$CompilationF {
  Fragment$CompilationF(
      {required this.commitHash,
      required this.status,
      required this.startTime,
      this.endTime,
      required this.logs,
      required this.serviceConfig,
      required this.$__typename});

  factory Fragment$CompilationF.fromJson(Map<String, dynamic> json) {
    final l$commitHash = json['commitHash'];
    final l$status = json['status'];
    final l$startTime = json['startTime'];
    final l$endTime = json['endTime'];
    final l$logs = json['logs'];
    final l$serviceConfig = json['serviceConfig'];
    final l$$__typename = json['__typename'];
    return Fragment$CompilationF(
        commitHash: (l$commitHash as String),
        status: fromJson$Enum$CompilationStatus((l$status as String)),
        startTime: DateTime.parse((l$startTime as String)),
        endTime:
            l$endTime == null ? null : DateTime.parse((l$endTime as String)),
        logs: (l$logs as List<dynamic>)
            .map((e) =>
                Fragment$CompilationLogF.fromJson((e as Map<String, dynamic>)))
            .toList(),
        serviceConfig: Fragment$ServiceConfigF.fromJson(
            (l$serviceConfig as Map<String, dynamic>)),
        $__typename: (l$$__typename as String));
  }

  final String commitHash;

  final Enum$CompilationStatus status;

  final DateTime startTime;

  final DateTime? endTime;

  final List<Fragment$CompilationLogF> logs;

  final Fragment$ServiceConfigF serviceConfig;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$commitHash = commitHash;
    _resultData['commitHash'] = l$commitHash;
    final l$status = status;
    _resultData['status'] = toJson$Enum$CompilationStatus(l$status);
    final l$startTime = startTime;
    _resultData['startTime'] = l$startTime.toIso8601String();
    final l$endTime = endTime;
    _resultData['endTime'] = l$endTime?.toIso8601String();
    final l$logs = logs;
    _resultData['logs'] = l$logs.map((e) => e.toJson()).toList();
    final l$serviceConfig = serviceConfig;
    _resultData['serviceConfig'] = l$serviceConfig.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$commitHash = commitHash;
    final l$status = status;
    final l$startTime = startTime;
    final l$endTime = endTime;
    final l$logs = logs;
    final l$serviceConfig = serviceConfig;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$commitHash,
      l$status,
      l$startTime,
      l$endTime,
      Object.hashAll(l$logs.map((v) => v)),
      l$serviceConfig,
      l$$__typename
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$CompilationF) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$commitHash = commitHash;
    final lOther$commitHash = other.commitHash;
    if (l$commitHash != lOther$commitHash) {
      return false;
    }
    final l$status = status;
    final lOther$status = other.status;
    if (l$status != lOther$status) {
      return false;
    }
    final l$startTime = startTime;
    final lOther$startTime = other.startTime;
    if (l$startTime != lOther$startTime) {
      return false;
    }
    final l$endTime = endTime;
    final lOther$endTime = other.endTime;
    if (l$endTime != lOther$endTime) {
      return false;
    }
    final l$logs = logs;
    final lOther$logs = other.logs;
    if (l$logs.length != lOther$logs.length) {
      return false;
    }
    for (int i = 0; i < l$logs.length; i++) {
      final l$logs$entry = l$logs[i];
      final lOther$logs$entry = lOther$logs[i];
      if (l$logs$entry != lOther$logs$entry) {
        return false;
      }
    }
    final l$serviceConfig = serviceConfig;
    final lOther$serviceConfig = other.serviceConfig;
    if (l$serviceConfig != lOther$serviceConfig) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$CompilationF on Fragment$CompilationF {
  CopyWith$Fragment$CompilationF<Fragment$CompilationF> get copyWith =>
      CopyWith$Fragment$CompilationF(this, (i) => i);
}

abstract class CopyWith$Fragment$CompilationF<TRes> {
  factory CopyWith$Fragment$CompilationF(Fragment$CompilationF instance,
          TRes Function(Fragment$CompilationF) then) =
      _CopyWithImpl$Fragment$CompilationF;

  factory CopyWith$Fragment$CompilationF.stub(TRes res) =
      _CopyWithStubImpl$Fragment$CompilationF;

  TRes call(
      {String? commitHash,
      Enum$CompilationStatus? status,
      DateTime? startTime,
      DateTime? endTime,
      List<Fragment$CompilationLogF>? logs,
      Fragment$ServiceConfigF? serviceConfig,
      String? $__typename});
  TRes logs(
      Iterable<Fragment$CompilationLogF> Function(
              Iterable<
                  CopyWith$Fragment$CompilationLogF<Fragment$CompilationLogF>>)
          _fn);
  CopyWith$Fragment$ServiceConfigF<TRes> get serviceConfig;
}

class _CopyWithImpl$Fragment$CompilationF<TRes>
    implements CopyWith$Fragment$CompilationF<TRes> {
  _CopyWithImpl$Fragment$CompilationF(this._instance, this._then);

  final Fragment$CompilationF _instance;

  final TRes Function(Fragment$CompilationF) _then;

  static const _undefined = {};

  TRes call(
          {Object? commitHash = _undefined,
          Object? status = _undefined,
          Object? startTime = _undefined,
          Object? endTime = _undefined,
          Object? logs = _undefined,
          Object? serviceConfig = _undefined,
          Object? $__typename = _undefined}) =>
      _then(Fragment$CompilationF(
          commitHash: commitHash == _undefined || commitHash == null
              ? _instance.commitHash
              : (commitHash as String),
          status: status == _undefined || status == null
              ? _instance.status
              : (status as Enum$CompilationStatus),
          startTime: startTime == _undefined || startTime == null
              ? _instance.startTime
              : (startTime as DateTime),
          endTime: endTime == _undefined
              ? _instance.endTime
              : (endTime as DateTime?),
          logs: logs == _undefined || logs == null
              ? _instance.logs
              : (logs as List<Fragment$CompilationLogF>),
          serviceConfig: serviceConfig == _undefined || serviceConfig == null
              ? _instance.serviceConfig
              : (serviceConfig as Fragment$ServiceConfigF),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
  TRes logs(
          Iterable<Fragment$CompilationLogF> Function(
                  Iterable<
                      CopyWith$Fragment$CompilationLogF<
                          Fragment$CompilationLogF>>)
              _fn) =>
      call(
          logs: _fn(_instance.logs
                  .map((e) => CopyWith$Fragment$CompilationLogF(e, (i) => i)))
              .toList());
  CopyWith$Fragment$ServiceConfigF<TRes> get serviceConfig {
    final local$serviceConfig = _instance.serviceConfig;
    return CopyWith$Fragment$ServiceConfigF(
        local$serviceConfig, (e) => call(serviceConfig: e));
  }
}

class _CopyWithStubImpl$Fragment$CompilationF<TRes>
    implements CopyWith$Fragment$CompilationF<TRes> {
  _CopyWithStubImpl$Fragment$CompilationF(this._res);

  TRes _res;

  call(
          {String? commitHash,
          Enum$CompilationStatus? status,
          DateTime? startTime,
          DateTime? endTime,
          List<Fragment$CompilationLogF>? logs,
          Fragment$ServiceConfigF? serviceConfig,
          String? $__typename}) =>
      _res;
  logs(_fn) => _res;
  CopyWith$Fragment$ServiceConfigF<TRes> get serviceConfig =>
      CopyWith$Fragment$ServiceConfigF.stub(_res);
}

const fragmentDefinitionCompilationF = FragmentDefinitionNode(
    name: NameNode(value: 'CompilationF'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
            name: NameNode(value: 'Compilation'), isNonNull: false)),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
          name: NameNode(value: 'commitHash'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'status'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'startTime'),
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
          name: NameNode(value: 'logs'),
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
          name: NameNode(value: 'serviceConfig'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FragmentSpreadNode(
                name: NameNode(value: 'ServiceConfigF'), directives: []),
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
const documentNodeFragmentCompilationF = DocumentNode(definitions: [
  fragmentDefinitionCompilationF,
  fragmentDefinitionCompilationLogF,
  fragmentDefinitionCommandExecutionF,
  fragmentDefinitionCliCommandF,
  fragmentDefinitionProcessExecResultF,
  fragmentDefinitionServiceConfigF,
]);

extension ClientExtension$Fragment$CompilationF on graphql.GraphQLClient {
  void writeFragment$CompilationF(
          {required Fragment$CompilationF data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'CompilationF',
                  document: documentNodeFragmentCompilationF)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$CompilationF? readFragment$CompilationF(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'CompilationF',
                document: documentNodeFragmentCompilationF)),
        optimistic: optimistic);
    return result == null ? null : Fragment$CompilationF.fromJson(result);
  }
}

class Fragment$ServiceConfigF {
  Fragment$ServiceConfigF(
      {required this.serviceId,
      required this.gitRepo,
      required this.gitBranch,
      required this.serverFile,
      required this.createdDate,
      required this.commands,
      required this.$__typename});

  factory Fragment$ServiceConfigF.fromJson(Map<String, dynamic> json) {
    final l$serviceId = json['serviceId'];
    final l$gitRepo = json['gitRepo'];
    final l$gitBranch = json['gitBranch'];
    final l$serverFile = json['serverFile'];
    final l$createdDate = json['createdDate'];
    final l$commands = json['commands'];
    final l$$__typename = json['__typename'];
    return Fragment$ServiceConfigF(
        serviceId: (l$serviceId as String),
        gitRepo: (l$gitRepo as String),
        gitBranch: (l$gitBranch as String),
        serverFile: (l$serverFile as String),
        createdDate: DateTime.parse((l$createdDate as String)),
        commands: (l$commands as List<dynamic>)
            .map((e) =>
                Fragment$CliCommandF.fromJson((e as Map<String, dynamic>)))
            .toList(),
        $__typename: (l$$__typename as String));
  }

  final String serviceId;

  final String gitRepo;

  final String gitBranch;

  final String serverFile;

  final DateTime createdDate;

  final List<Fragment$CliCommandF> commands;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$serviceId = serviceId;
    _resultData['serviceId'] = l$serviceId;
    final l$gitRepo = gitRepo;
    _resultData['gitRepo'] = l$gitRepo;
    final l$gitBranch = gitBranch;
    _resultData['gitBranch'] = l$gitBranch;
    final l$serverFile = serverFile;
    _resultData['serverFile'] = l$serverFile;
    final l$createdDate = createdDate;
    _resultData['createdDate'] = l$createdDate.toIso8601String();
    final l$commands = commands;
    _resultData['commands'] = l$commands.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$serviceId = serviceId;
    final l$gitRepo = gitRepo;
    final l$gitBranch = gitBranch;
    final l$serverFile = serverFile;
    final l$createdDate = createdDate;
    final l$commands = commands;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$serviceId,
      l$gitRepo,
      l$gitBranch,
      l$serverFile,
      l$createdDate,
      Object.hashAll(l$commands.map((v) => v)),
      l$$__typename
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ServiceConfigF) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceId = serviceId;
    final lOther$serviceId = other.serviceId;
    if (l$serviceId != lOther$serviceId) {
      return false;
    }
    final l$gitRepo = gitRepo;
    final lOther$gitRepo = other.gitRepo;
    if (l$gitRepo != lOther$gitRepo) {
      return false;
    }
    final l$gitBranch = gitBranch;
    final lOther$gitBranch = other.gitBranch;
    if (l$gitBranch != lOther$gitBranch) {
      return false;
    }
    final l$serverFile = serverFile;
    final lOther$serverFile = other.serverFile;
    if (l$serverFile != lOther$serverFile) {
      return false;
    }
    final l$createdDate = createdDate;
    final lOther$createdDate = other.createdDate;
    if (l$createdDate != lOther$createdDate) {
      return false;
    }
    final l$commands = commands;
    final lOther$commands = other.commands;
    if (l$commands.length != lOther$commands.length) {
      return false;
    }
    for (int i = 0; i < l$commands.length; i++) {
      final l$commands$entry = l$commands[i];
      final lOther$commands$entry = lOther$commands[i];
      if (l$commands$entry != lOther$commands$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$ServiceConfigF on Fragment$ServiceConfigF {
  CopyWith$Fragment$ServiceConfigF<Fragment$ServiceConfigF> get copyWith =>
      CopyWith$Fragment$ServiceConfigF(this, (i) => i);
}

abstract class CopyWith$Fragment$ServiceConfigF<TRes> {
  factory CopyWith$Fragment$ServiceConfigF(Fragment$ServiceConfigF instance,
          TRes Function(Fragment$ServiceConfigF) then) =
      _CopyWithImpl$Fragment$ServiceConfigF;

  factory CopyWith$Fragment$ServiceConfigF.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ServiceConfigF;

  TRes call(
      {String? serviceId,
      String? gitRepo,
      String? gitBranch,
      String? serverFile,
      DateTime? createdDate,
      List<Fragment$CliCommandF>? commands,
      String? $__typename});
  TRes commands(
      Iterable<Fragment$CliCommandF> Function(
              Iterable<CopyWith$Fragment$CliCommandF<Fragment$CliCommandF>>)
          _fn);
}

class _CopyWithImpl$Fragment$ServiceConfigF<TRes>
    implements CopyWith$Fragment$ServiceConfigF<TRes> {
  _CopyWithImpl$Fragment$ServiceConfigF(this._instance, this._then);

  final Fragment$ServiceConfigF _instance;

  final TRes Function(Fragment$ServiceConfigF) _then;

  static const _undefined = {};

  TRes call(
          {Object? serviceId = _undefined,
          Object? gitRepo = _undefined,
          Object? gitBranch = _undefined,
          Object? serverFile = _undefined,
          Object? createdDate = _undefined,
          Object? commands = _undefined,
          Object? $__typename = _undefined}) =>
      _then(Fragment$ServiceConfigF(
          serviceId: serviceId == _undefined || serviceId == null
              ? _instance.serviceId
              : (serviceId as String),
          gitRepo: gitRepo == _undefined || gitRepo == null
              ? _instance.gitRepo
              : (gitRepo as String),
          gitBranch: gitBranch == _undefined || gitBranch == null
              ? _instance.gitBranch
              : (gitBranch as String),
          serverFile: serverFile == _undefined || serverFile == null
              ? _instance.serverFile
              : (serverFile as String),
          createdDate: createdDate == _undefined || createdDate == null
              ? _instance.createdDate
              : (createdDate as DateTime),
          commands: commands == _undefined || commands == null
              ? _instance.commands
              : (commands as List<Fragment$CliCommandF>),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
  TRes commands(
          Iterable<Fragment$CliCommandF> Function(
                  Iterable<CopyWith$Fragment$CliCommandF<Fragment$CliCommandF>>)
              _fn) =>
      call(
          commands: _fn(_instance.commands
                  .map((e) => CopyWith$Fragment$CliCommandF(e, (i) => i)))
              .toList());
}

class _CopyWithStubImpl$Fragment$ServiceConfigF<TRes>
    implements CopyWith$Fragment$ServiceConfigF<TRes> {
  _CopyWithStubImpl$Fragment$ServiceConfigF(this._res);

  TRes _res;

  call(
          {String? serviceId,
          String? gitRepo,
          String? gitBranch,
          String? serverFile,
          DateTime? createdDate,
          List<Fragment$CliCommandF>? commands,
          String? $__typename}) =>
      _res;
  commands(_fn) => _res;
}

const fragmentDefinitionServiceConfigF = FragmentDefinitionNode(
    name: NameNode(value: 'ServiceConfigF'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
            name: NameNode(value: 'ServiceConfig'), isNonNull: false)),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
          name: NameNode(value: 'serviceId'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'gitRepo'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'gitBranch'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'serverFile'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'createdDate'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null),
      FieldNode(
          name: NameNode(value: 'commands'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FragmentSpreadNode(
                name: NameNode(value: 'CliCommandF'), directives: []),
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
const documentNodeFragmentServiceConfigF = DocumentNode(definitions: [
  fragmentDefinitionServiceConfigF,
  fragmentDefinitionCliCommandF,
]);

extension ClientExtension$Fragment$ServiceConfigF on graphql.GraphQLClient {
  void writeFragment$ServiceConfigF(
          {required Fragment$ServiceConfigF data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'ServiceConfigF',
                  document: documentNodeFragmentServiceConfigF)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$ServiceConfigF? readFragment$ServiceConfigF(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'ServiceConfigF',
                document: documentNodeFragmentServiceConfigF)),
        optimistic: optimistic);
    return result == null ? null : Fragment$ServiceConfigF.fromJson(result);
  }
}

class Fragment$CliCommandF {
  Fragment$CliCommandF(
      {required this.name,
      required this.command,
      required this.modifiedDate,
      required this.variables,
      required this.$__typename});

  factory Fragment$CliCommandF.fromJson(Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$command = json['command'];
    final l$modifiedDate = json['modifiedDate'];
    final l$variables = json['variables'];
    final l$$__typename = json['__typename'];
    return Fragment$CliCommandF(
        name: (l$name as String),
        command:
            (l$command as List<dynamic>).map((e) => (e as String)).toList(),
        modifiedDate: DateTime.parse((l$modifiedDate as String)),
        variables: (l$variables as List<dynamic>)
            .map((e) => Fragment$CliCommandF$variables.fromJson(
                (e as Map<String, dynamic>)))
            .toList(),
        $__typename: (l$$__typename as String));
  }

  final String name;

  final List<String> command;

  final DateTime modifiedDate;

  final List<Fragment$CliCommandF$variables> variables;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$command = command;
    _resultData['command'] = l$command.map((e) => e).toList();
    final l$modifiedDate = modifiedDate;
    _resultData['modifiedDate'] = l$modifiedDate.toIso8601String();
    final l$variables = variables;
    _resultData['variables'] = l$variables.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$command = command;
    final l$modifiedDate = modifiedDate;
    final l$variables = variables;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      Object.hashAll(l$command.map((v) => v)),
      l$modifiedDate,
      Object.hashAll(l$variables.map((v) => v)),
      l$$__typename
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$CliCommandF) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$command = command;
    final lOther$command = other.command;
    if (l$command.length != lOther$command.length) {
      return false;
    }
    for (int i = 0; i < l$command.length; i++) {
      final l$command$entry = l$command[i];
      final lOther$command$entry = lOther$command[i];
      if (l$command$entry != lOther$command$entry) {
        return false;
      }
    }
    final l$modifiedDate = modifiedDate;
    final lOther$modifiedDate = other.modifiedDate;
    if (l$modifiedDate != lOther$modifiedDate) {
      return false;
    }
    final l$variables = variables;
    final lOther$variables = other.variables;
    if (l$variables.length != lOther$variables.length) {
      return false;
    }
    for (int i = 0; i < l$variables.length; i++) {
      final l$variables$entry = l$variables[i];
      final lOther$variables$entry = lOther$variables[i];
      if (l$variables$entry != lOther$variables$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$CliCommandF on Fragment$CliCommandF {
  CopyWith$Fragment$CliCommandF<Fragment$CliCommandF> get copyWith =>
      CopyWith$Fragment$CliCommandF(this, (i) => i);
}

abstract class CopyWith$Fragment$CliCommandF<TRes> {
  factory CopyWith$Fragment$CliCommandF(Fragment$CliCommandF instance,
          TRes Function(Fragment$CliCommandF) then) =
      _CopyWithImpl$Fragment$CliCommandF;

  factory CopyWith$Fragment$CliCommandF.stub(TRes res) =
      _CopyWithStubImpl$Fragment$CliCommandF;

  TRes call(
      {String? name,
      List<String>? command,
      DateTime? modifiedDate,
      List<Fragment$CliCommandF$variables>? variables,
      String? $__typename});
  TRes variables(
      Iterable<Fragment$CliCommandF$variables> Function(
              Iterable<
                  CopyWith$Fragment$CliCommandF$variables<
                      Fragment$CliCommandF$variables>>)
          _fn);
}

class _CopyWithImpl$Fragment$CliCommandF<TRes>
    implements CopyWith$Fragment$CliCommandF<TRes> {
  _CopyWithImpl$Fragment$CliCommandF(this._instance, this._then);

  final Fragment$CliCommandF _instance;

  final TRes Function(Fragment$CliCommandF) _then;

  static const _undefined = {};

  TRes call(
          {Object? name = _undefined,
          Object? command = _undefined,
          Object? modifiedDate = _undefined,
          Object? variables = _undefined,
          Object? $__typename = _undefined}) =>
      _then(Fragment$CliCommandF(
          name: name == _undefined || name == null
              ? _instance.name
              : (name as String),
          command: command == _undefined || command == null
              ? _instance.command
              : (command as List<String>),
          modifiedDate: modifiedDate == _undefined || modifiedDate == null
              ? _instance.modifiedDate
              : (modifiedDate as DateTime),
          variables: variables == _undefined || variables == null
              ? _instance.variables
              : (variables as List<Fragment$CliCommandF$variables>),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
  TRes variables(
          Iterable<Fragment$CliCommandF$variables> Function(
                  Iterable<
                      CopyWith$Fragment$CliCommandF$variables<
                          Fragment$CliCommandF$variables>>)
              _fn) =>
      call(
          variables: _fn(_instance.variables.map(
                  (e) => CopyWith$Fragment$CliCommandF$variables(e, (i) => i)))
              .toList());
}

class _CopyWithStubImpl$Fragment$CliCommandF<TRes>
    implements CopyWith$Fragment$CliCommandF<TRes> {
  _CopyWithStubImpl$Fragment$CliCommandF(this._res);

  TRes _res;

  call(
          {String? name,
          List<String>? command,
          DateTime? modifiedDate,
          List<Fragment$CliCommandF$variables>? variables,
          String? $__typename}) =>
      _res;
  variables(_fn) => _res;
}

const fragmentDefinitionCliCommandF = FragmentDefinitionNode(
    name: NameNode(value: 'CliCommandF'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
            name: NameNode(value: 'CliCommand'), isNonNull: false)),
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
          name: NameNode(value: 'variables'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: SelectionSetNode(selections: [
            FieldNode(
                name: NameNode(value: 'type'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            FieldNode(
                name: NameNode(value: 'value'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null),
            FieldNode(
                name: NameNode(value: 'key'),
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
          name: NameNode(value: '__typename'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null)
    ]));
const documentNodeFragmentCliCommandF = DocumentNode(definitions: [
  fragmentDefinitionCliCommandF,
]);

extension ClientExtension$Fragment$CliCommandF on graphql.GraphQLClient {
  void writeFragment$CliCommandF(
          {required Fragment$CliCommandF data,
          required Map<String, dynamic> idFields,
          bool broadcast = true}) =>
      this.writeFragment(
          graphql.FragmentRequest(
              idFields: idFields,
              fragment: const graphql.Fragment(
                  fragmentName: 'CliCommandF',
                  document: documentNodeFragmentCliCommandF)),
          data: data.toJson(),
          broadcast: broadcast);
  Fragment$CliCommandF? readFragment$CliCommandF(
      {required Map<String, dynamic> idFields, bool optimistic = true}) {
    final result = this.readFragment(
        graphql.FragmentRequest(
            idFields: idFields,
            fragment: const graphql.Fragment(
                fragmentName: 'CliCommandF',
                document: documentNodeFragmentCliCommandF)),
        optimistic: optimistic);
    return result == null ? null : Fragment$CliCommandF.fromJson(result);
  }
}

class Fragment$CliCommandF$variables {
  Fragment$CliCommandF$variables(
      {required this.type,
      required this.value,
      required this.key,
      required this.$__typename});

  factory Fragment$CliCommandF$variables.fromJson(Map<String, dynamic> json) {
    final l$type = json['type'];
    final l$value = json['value'];
    final l$key = json['key'];
    final l$$__typename = json['__typename'];
    return Fragment$CliCommandF$variables(
        type: fromJson$Enum$CliCommandVariableType((l$type as String)),
        value: (l$value as String),
        key: (l$key as String),
        $__typename: (l$$__typename as String));
  }

  final Enum$CliCommandVariableType type;

  final String value;

  final String key;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$type = type;
    _resultData['type'] = toJson$Enum$CliCommandVariableType(l$type);
    final l$value = value;
    _resultData['value'] = l$value;
    final l$key = key;
    _resultData['key'] = l$key;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$type = type;
    final l$value = value;
    final l$key = key;
    final l$$__typename = $__typename;
    return Object.hashAll([l$type, l$value, l$key, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$CliCommandF$variables) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (l$type != lOther$type) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
      return false;
    }
    final l$key = key;
    final lOther$key = other.key;
    if (l$key != lOther$key) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$CliCommandF$variables
    on Fragment$CliCommandF$variables {
  CopyWith$Fragment$CliCommandF$variables<Fragment$CliCommandF$variables>
      get copyWith => CopyWith$Fragment$CliCommandF$variables(this, (i) => i);
}

abstract class CopyWith$Fragment$CliCommandF$variables<TRes> {
  factory CopyWith$Fragment$CliCommandF$variables(
          Fragment$CliCommandF$variables instance,
          TRes Function(Fragment$CliCommandF$variables) then) =
      _CopyWithImpl$Fragment$CliCommandF$variables;

  factory CopyWith$Fragment$CliCommandF$variables.stub(TRes res) =
      _CopyWithStubImpl$Fragment$CliCommandF$variables;

  TRes call(
      {Enum$CliCommandVariableType? type,
      String? value,
      String? key,
      String? $__typename});
}

class _CopyWithImpl$Fragment$CliCommandF$variables<TRes>
    implements CopyWith$Fragment$CliCommandF$variables<TRes> {
  _CopyWithImpl$Fragment$CliCommandF$variables(this._instance, this._then);

  final Fragment$CliCommandF$variables _instance;

  final TRes Function(Fragment$CliCommandF$variables) _then;

  static const _undefined = {};

  TRes call(
          {Object? type = _undefined,
          Object? value = _undefined,
          Object? key = _undefined,
          Object? $__typename = _undefined}) =>
      _then(Fragment$CliCommandF$variables(
          type: type == _undefined || type == null
              ? _instance.type
              : (type as Enum$CliCommandVariableType),
          value: value == _undefined || value == null
              ? _instance.value
              : (value as String),
          key: key == _undefined || key == null
              ? _instance.key
              : (key as String),
          $__typename: $__typename == _undefined || $__typename == null
              ? _instance.$__typename
              : ($__typename as String)));
}

class _CopyWithStubImpl$Fragment$CliCommandF$variables<TRes>
    implements CopyWith$Fragment$CliCommandF$variables<TRes> {
  _CopyWithStubImpl$Fragment$CliCommandF$variables(this._res);

  TRes _res;

  call(
          {Enum$CliCommandVariableType? type,
          String? value,
          String? key,
          String? $__typename}) =>
      _res;
}

class Query$topResult {
  Query$topResult({this.topOutput, required this.$__typename});

  factory Query$topResult.fromJson(Map<String, dynamic> json) {
    final l$topOutput = json['topOutput'];
    final l$$__typename = json['__typename'];
    return Query$topResult(
        topOutput: (l$topOutput as String?),
        $__typename: (l$$__typename as String));
  }

  final String? topOutput;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$topOutput = topOutput;
    _resultData['topOutput'] = l$topOutput;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$topOutput = topOutput;
    final l$$__typename = $__typename;
    return Object.hashAll([l$topOutput, l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$topResult) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$topOutput = topOutput;
    final lOther$topOutput = other.topOutput;
    if (l$topOutput != lOther$topOutput) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
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

class Mutation$startService {
  Mutation$startService(
      {required this.startService, required this.$__typename});

  factory Mutation$startService.fromJson(Map<String, dynamic> json) {
    final l$startService = json['startService'];
    final l$$__typename = json['__typename'];
    return Mutation$startService(
        startService: (l$startService as List<dynamic>)
            .map((e) =>
                Fragment$CompilationLogF.fromJson((e as Map<String, dynamic>)))
            .toList(),
        $__typename: (l$$__typename as String));
  }

  final List<Fragment$CompilationLogF> startService;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$startService = startService;
    _resultData['startService'] =
        l$startService.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$startService = startService;
    final l$$__typename = $__typename;
    return Object.hashAll(
        [Object.hashAll(l$startService.map((v) => v)), l$$__typename]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$startService) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$startService = startService;
    final lOther$startService = other.startService;
    if (l$startService.length != lOther$startService.length) {
      return false;
    }
    for (int i = 0; i < l$startService.length; i++) {
      final l$startService$entry = l$startService[i];
      final lOther$startService$entry = lOther$startService[i];
      if (l$startService$entry != lOther$startService$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
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
  fragmentDefinitionCommandExecutionF,
  fragmentDefinitionCliCommandF,
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

class Variables$Subscription$createServiceAndReceiveUpdates {
  factory Variables$Subscription$createServiceAndReceiveUpdates(
          {required Input$ServiceConfigInput serviceConfig}) =>
      Variables$Subscription$createServiceAndReceiveUpdates._({
        r'serviceConfig': serviceConfig,
      });

  Variables$Subscription$createServiceAndReceiveUpdates._(this._$data);

  factory Variables$Subscription$createServiceAndReceiveUpdates.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$serviceConfig = data['serviceConfig'];
    result$data['serviceConfig'] = Input$ServiceConfigInput.fromJson(
        (l$serviceConfig as Map<String, dynamic>));
    return Variables$Subscription$createServiceAndReceiveUpdates._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$ServiceConfigInput get serviceConfig =>
      (_$data['serviceConfig'] as Input$ServiceConfigInput);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceConfig = serviceConfig;
    result$data['serviceConfig'] = l$serviceConfig.toJson();
    return result$data;
  }

  CopyWith$Variables$Subscription$createServiceAndReceiveUpdates<
          Variables$Subscription$createServiceAndReceiveUpdates>
      get copyWith =>
          CopyWith$Variables$Subscription$createServiceAndReceiveUpdates(
              this, (i) => i);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$createServiceAndReceiveUpdates) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceConfig = serviceConfig;
    final lOther$serviceConfig = other.serviceConfig;
    if (l$serviceConfig != lOther$serviceConfig) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$serviceConfig = serviceConfig;
    return Object.hashAll([l$serviceConfig]);
  }
}

abstract class CopyWith$Variables$Subscription$createServiceAndReceiveUpdates<
    TRes> {
  factory CopyWith$Variables$Subscription$createServiceAndReceiveUpdates(
          Variables$Subscription$createServiceAndReceiveUpdates instance,
          TRes Function(Variables$Subscription$createServiceAndReceiveUpdates)
              then) =
      _CopyWithImpl$Variables$Subscription$createServiceAndReceiveUpdates;

  factory CopyWith$Variables$Subscription$createServiceAndReceiveUpdates.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$createServiceAndReceiveUpdates;

  TRes call({Input$ServiceConfigInput? serviceConfig});
}

class _CopyWithImpl$Variables$Subscription$createServiceAndReceiveUpdates<TRes>
    implements
        CopyWith$Variables$Subscription$createServiceAndReceiveUpdates<TRes> {
  _CopyWithImpl$Variables$Subscription$createServiceAndReceiveUpdates(
      this._instance, this._then);

  final Variables$Subscription$createServiceAndReceiveUpdates _instance;

  final TRes Function(Variables$Subscription$createServiceAndReceiveUpdates)
      _then;

  static const _undefined = {};

  TRes call({Object? serviceConfig = _undefined}) =>
      _then(Variables$Subscription$createServiceAndReceiveUpdates._({
        ..._instance._$data,
        if (serviceConfig != _undefined && serviceConfig != null)
          'serviceConfig': (serviceConfig as Input$ServiceConfigInput),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$createServiceAndReceiveUpdates<
        TRes>
    implements
        CopyWith$Variables$Subscription$createServiceAndReceiveUpdates<TRes> {
  _CopyWithStubImpl$Variables$Subscription$createServiceAndReceiveUpdates(
      this._res);

  TRes _res;

  call({Input$ServiceConfigInput? serviceConfig}) => _res;
}

class Subscription$createServiceAndReceiveUpdates {
  Subscription$createServiceAndReceiveUpdates(
      {required this.createServiceAndReceiveUpdates});

  factory Subscription$createServiceAndReceiveUpdates.fromJson(
      Map<String, dynamic> json) {
    final l$createServiceAndReceiveUpdates =
        json['createServiceAndReceiveUpdates'];
    return Subscription$createServiceAndReceiveUpdates(
        createServiceAndReceiveUpdates: Fragment$CompilationEventF.fromJson(
            (l$createServiceAndReceiveUpdates as Map<String, dynamic>)));
  }

  final Fragment$CompilationEventF createServiceAndReceiveUpdates;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$createServiceAndReceiveUpdates = createServiceAndReceiveUpdates;
    _resultData['createServiceAndReceiveUpdates'] =
        l$createServiceAndReceiveUpdates.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$createServiceAndReceiveUpdates = createServiceAndReceiveUpdates;
    return Object.hashAll([l$createServiceAndReceiveUpdates]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$createServiceAndReceiveUpdates) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$createServiceAndReceiveUpdates = createServiceAndReceiveUpdates;
    final lOther$createServiceAndReceiveUpdates =
        other.createServiceAndReceiveUpdates;
    if (l$createServiceAndReceiveUpdates !=
        lOther$createServiceAndReceiveUpdates) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$createServiceAndReceiveUpdates
    on Subscription$createServiceAndReceiveUpdates {
  CopyWith$Subscription$createServiceAndReceiveUpdates<
          Subscription$createServiceAndReceiveUpdates>
      get copyWith =>
          CopyWith$Subscription$createServiceAndReceiveUpdates(this, (i) => i);
}

abstract class CopyWith$Subscription$createServiceAndReceiveUpdates<TRes> {
  factory CopyWith$Subscription$createServiceAndReceiveUpdates(
          Subscription$createServiceAndReceiveUpdates instance,
          TRes Function(Subscription$createServiceAndReceiveUpdates) then) =
      _CopyWithImpl$Subscription$createServiceAndReceiveUpdates;

  factory CopyWith$Subscription$createServiceAndReceiveUpdates.stub(TRes res) =
      _CopyWithStubImpl$Subscription$createServiceAndReceiveUpdates;

  TRes call({Fragment$CompilationEventF? createServiceAndReceiveUpdates});
  CopyWith$Fragment$CompilationEventF<TRes> get createServiceAndReceiveUpdates;
}

class _CopyWithImpl$Subscription$createServiceAndReceiveUpdates<TRes>
    implements CopyWith$Subscription$createServiceAndReceiveUpdates<TRes> {
  _CopyWithImpl$Subscription$createServiceAndReceiveUpdates(
      this._instance, this._then);

  final Subscription$createServiceAndReceiveUpdates _instance;

  final TRes Function(Subscription$createServiceAndReceiveUpdates) _then;

  static const _undefined = {};

  TRes call({Object? createServiceAndReceiveUpdates = _undefined}) =>
      _then(Subscription$createServiceAndReceiveUpdates(
          createServiceAndReceiveUpdates:
              createServiceAndReceiveUpdates == _undefined ||
                      createServiceAndReceiveUpdates == null
                  ? _instance.createServiceAndReceiveUpdates
                  : (createServiceAndReceiveUpdates
                      as Fragment$CompilationEventF)));
  CopyWith$Fragment$CompilationEventF<TRes> get createServiceAndReceiveUpdates {
    final local$createServiceAndReceiveUpdates =
        _instance.createServiceAndReceiveUpdates;
    return CopyWith$Fragment$CompilationEventF(
        local$createServiceAndReceiveUpdates,
        (e) => call(createServiceAndReceiveUpdates: e));
  }
}

class _CopyWithStubImpl$Subscription$createServiceAndReceiveUpdates<TRes>
    implements CopyWith$Subscription$createServiceAndReceiveUpdates<TRes> {
  _CopyWithStubImpl$Subscription$createServiceAndReceiveUpdates(this._res);

  TRes _res;

  call({Fragment$CompilationEventF? createServiceAndReceiveUpdates}) => _res;
  CopyWith$Fragment$CompilationEventF<TRes>
      get createServiceAndReceiveUpdates =>
          CopyWith$Fragment$CompilationEventF.stub(_res);
}

const documentNodeSubscriptioncreateServiceAndReceiveUpdates =
    DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.subscription,
      name: NameNode(value: 'createServiceAndReceiveUpdates'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'serviceConfig')),
            type: NamedTypeNode(
                name: NameNode(value: 'ServiceConfigInput'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'createServiceAndReceiveUpdates'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'config'),
                  value: VariableNode(name: NameNode(value: 'serviceConfig')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'CompilationEventF'), directives: []),
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ])),
  fragmentDefinitionCompilationEventF,
  fragmentDefinitionCompilationF,
  fragmentDefinitionCompilationLogF,
  fragmentDefinitionCommandExecutionF,
  fragmentDefinitionCliCommandF,
  fragmentDefinitionProcessExecResultF,
  fragmentDefinitionServiceConfigF,
]);
Subscription$createServiceAndReceiveUpdates
    _parserFn$Subscription$createServiceAndReceiveUpdates(
            Map<String, dynamic> data) =>
        Subscription$createServiceAndReceiveUpdates.fromJson(data);

class Options$Subscription$createServiceAndReceiveUpdates extends graphql
    .SubscriptionOptions<Subscription$createServiceAndReceiveUpdates> {
  Options$Subscription$createServiceAndReceiveUpdates(
      {String? operationName,
      required Variables$Subscription$createServiceAndReceiveUpdates variables,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context})
      : super(
            variables: variables.toJson(),
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            document: documentNodeSubscriptioncreateServiceAndReceiveUpdates,
            parserFn: _parserFn$Subscription$createServiceAndReceiveUpdates);
}

class WatchOptions$Subscription$createServiceAndReceiveUpdates extends graphql
    .WatchQueryOptions<Subscription$createServiceAndReceiveUpdates> {
  WatchOptions$Subscription$createServiceAndReceiveUpdates(
      {String? operationName,
      required Variables$Subscription$createServiceAndReceiveUpdates variables,
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
            variables: variables.toJson(),
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            document: documentNodeSubscriptioncreateServiceAndReceiveUpdates,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Subscription$createServiceAndReceiveUpdates);
}

class FetchMoreOptions$Subscription$createServiceAndReceiveUpdates
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$createServiceAndReceiveUpdates(
      {required graphql.UpdateQuery updateQuery,
      required Variables$Subscription$createServiceAndReceiveUpdates variables})
      : super(
            updateQuery: updateQuery,
            variables: variables.toJson(),
            document: documentNodeSubscriptioncreateServiceAndReceiveUpdates);
}

extension ClientExtension$Subscription$createServiceAndReceiveUpdates
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$createServiceAndReceiveUpdates>>
      subscribe$createServiceAndReceiveUpdates(
              Options$Subscription$createServiceAndReceiveUpdates options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$createServiceAndReceiveUpdates>
      watchSubscription$createServiceAndReceiveUpdates(
              WatchOptions$Subscription$createServiceAndReceiveUpdates
                  options) =>
          this.watchQuery(options);
}

class Variables$Subscription$serviceUpdates {
  factory Variables$Subscription$serviceUpdates({required String serviceId}) =>
      Variables$Subscription$serviceUpdates._({
        r'serviceId': serviceId,
      });

  Variables$Subscription$serviceUpdates._(this._$data);

  factory Variables$Subscription$serviceUpdates.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$serviceId = data['serviceId'];
    result$data['serviceId'] = (l$serviceId as String);
    return Variables$Subscription$serviceUpdates._(result$data);
  }

  Map<String, dynamic> _$data;

  String get serviceId => (_$data['serviceId'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$serviceId = serviceId;
    result$data['serviceId'] = l$serviceId;
    return result$data;
  }

  CopyWith$Variables$Subscription$serviceUpdates<
          Variables$Subscription$serviceUpdates>
      get copyWith =>
          CopyWith$Variables$Subscription$serviceUpdates(this, (i) => i);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$serviceUpdates) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceId = serviceId;
    final lOther$serviceId = other.serviceId;
    if (l$serviceId != lOther$serviceId) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$serviceId = serviceId;
    return Object.hashAll([l$serviceId]);
  }
}

abstract class CopyWith$Variables$Subscription$serviceUpdates<TRes> {
  factory CopyWith$Variables$Subscription$serviceUpdates(
          Variables$Subscription$serviceUpdates instance,
          TRes Function(Variables$Subscription$serviceUpdates) then) =
      _CopyWithImpl$Variables$Subscription$serviceUpdates;

  factory CopyWith$Variables$Subscription$serviceUpdates.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$serviceUpdates;

  TRes call({String? serviceId});
}

class _CopyWithImpl$Variables$Subscription$serviceUpdates<TRes>
    implements CopyWith$Variables$Subscription$serviceUpdates<TRes> {
  _CopyWithImpl$Variables$Subscription$serviceUpdates(
      this._instance, this._then);

  final Variables$Subscription$serviceUpdates _instance;

  final TRes Function(Variables$Subscription$serviceUpdates) _then;

  static const _undefined = {};

  TRes call({Object? serviceId = _undefined}) =>
      _then(Variables$Subscription$serviceUpdates._({
        ..._instance._$data,
        if (serviceId != _undefined && serviceId != null)
          'serviceId': (serviceId as String),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$serviceUpdates<TRes>
    implements CopyWith$Variables$Subscription$serviceUpdates<TRes> {
  _CopyWithStubImpl$Variables$Subscription$serviceUpdates(this._res);

  TRes _res;

  call({String? serviceId}) => _res;
}

class Subscription$serviceUpdates {
  Subscription$serviceUpdates({required this.serviceUpdates});

  factory Subscription$serviceUpdates.fromJson(Map<String, dynamic> json) {
    final l$serviceUpdates = json['serviceUpdates'];
    return Subscription$serviceUpdates(
        serviceUpdates: Fragment$CompilationEventF.fromJson(
            (l$serviceUpdates as Map<String, dynamic>)));
  }

  final Fragment$CompilationEventF serviceUpdates;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$serviceUpdates = serviceUpdates;
    _resultData['serviceUpdates'] = l$serviceUpdates.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$serviceUpdates = serviceUpdates;
    return Object.hashAll([l$serviceUpdates]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$serviceUpdates) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$serviceUpdates = serviceUpdates;
    final lOther$serviceUpdates = other.serviceUpdates;
    if (l$serviceUpdates != lOther$serviceUpdates) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$serviceUpdates
    on Subscription$serviceUpdates {
  CopyWith$Subscription$serviceUpdates<Subscription$serviceUpdates>
      get copyWith => CopyWith$Subscription$serviceUpdates(this, (i) => i);
}

abstract class CopyWith$Subscription$serviceUpdates<TRes> {
  factory CopyWith$Subscription$serviceUpdates(
          Subscription$serviceUpdates instance,
          TRes Function(Subscription$serviceUpdates) then) =
      _CopyWithImpl$Subscription$serviceUpdates;

  factory CopyWith$Subscription$serviceUpdates.stub(TRes res) =
      _CopyWithStubImpl$Subscription$serviceUpdates;

  TRes call({Fragment$CompilationEventF? serviceUpdates});
  CopyWith$Fragment$CompilationEventF<TRes> get serviceUpdates;
}

class _CopyWithImpl$Subscription$serviceUpdates<TRes>
    implements CopyWith$Subscription$serviceUpdates<TRes> {
  _CopyWithImpl$Subscription$serviceUpdates(this._instance, this._then);

  final Subscription$serviceUpdates _instance;

  final TRes Function(Subscription$serviceUpdates) _then;

  static const _undefined = {};

  TRes call({Object? serviceUpdates = _undefined}) =>
      _then(Subscription$serviceUpdates(
          serviceUpdates: serviceUpdates == _undefined || serviceUpdates == null
              ? _instance.serviceUpdates
              : (serviceUpdates as Fragment$CompilationEventF)));
  CopyWith$Fragment$CompilationEventF<TRes> get serviceUpdates {
    final local$serviceUpdates = _instance.serviceUpdates;
    return CopyWith$Fragment$CompilationEventF(
        local$serviceUpdates, (e) => call(serviceUpdates: e));
  }
}

class _CopyWithStubImpl$Subscription$serviceUpdates<TRes>
    implements CopyWith$Subscription$serviceUpdates<TRes> {
  _CopyWithStubImpl$Subscription$serviceUpdates(this._res);

  TRes _res;

  call({Fragment$CompilationEventF? serviceUpdates}) => _res;
  CopyWith$Fragment$CompilationEventF<TRes> get serviceUpdates =>
      CopyWith$Fragment$CompilationEventF.stub(_res);
}

const documentNodeSubscriptionserviceUpdates = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.subscription,
      name: NameNode(value: 'serviceUpdates'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'serviceId')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'serviceUpdates'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'serviceId'),
                  value: VariableNode(name: NameNode(value: 'serviceId')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'CompilationEventF'), directives: []),
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ])),
  fragmentDefinitionCompilationEventF,
  fragmentDefinitionCompilationF,
  fragmentDefinitionCompilationLogF,
  fragmentDefinitionCommandExecutionF,
  fragmentDefinitionCliCommandF,
  fragmentDefinitionProcessExecResultF,
  fragmentDefinitionServiceConfigF,
]);
Subscription$serviceUpdates _parserFn$Subscription$serviceUpdates(
        Map<String, dynamic> data) =>
    Subscription$serviceUpdates.fromJson(data);

class Options$Subscription$serviceUpdates
    extends graphql.SubscriptionOptions<Subscription$serviceUpdates> {
  Options$Subscription$serviceUpdates(
      {String? operationName,
      required Variables$Subscription$serviceUpdates variables,
      graphql.FetchPolicy? fetchPolicy,
      graphql.ErrorPolicy? errorPolicy,
      graphql.CacheRereadPolicy? cacheRereadPolicy,
      Object? optimisticResult,
      graphql.Context? context})
      : super(
            variables: variables.toJson(),
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            document: documentNodeSubscriptionserviceUpdates,
            parserFn: _parserFn$Subscription$serviceUpdates);
}

class WatchOptions$Subscription$serviceUpdates
    extends graphql.WatchQueryOptions<Subscription$serviceUpdates> {
  WatchOptions$Subscription$serviceUpdates(
      {String? operationName,
      required Variables$Subscription$serviceUpdates variables,
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
            variables: variables.toJson(),
            operationName: operationName,
            fetchPolicy: fetchPolicy,
            errorPolicy: errorPolicy,
            cacheRereadPolicy: cacheRereadPolicy,
            optimisticResult: optimisticResult,
            context: context,
            document: documentNodeSubscriptionserviceUpdates,
            pollInterval: pollInterval,
            eagerlyFetchResults: eagerlyFetchResults,
            carryForwardDataOnException: carryForwardDataOnException,
            fetchResults: fetchResults,
            parserFn: _parserFn$Subscription$serviceUpdates);
}

class FetchMoreOptions$Subscription$serviceUpdates
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$serviceUpdates(
      {required graphql.UpdateQuery updateQuery,
      required Variables$Subscription$serviceUpdates variables})
      : super(
            updateQuery: updateQuery,
            variables: variables.toJson(),
            document: documentNodeSubscriptionserviceUpdates);
}

extension ClientExtension$Subscription$serviceUpdates on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$serviceUpdates>>
      subscribe$serviceUpdates(Options$Subscription$serviceUpdates options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$serviceUpdates>
      watchSubscription$serviceUpdates(
              WatchOptions$Subscription$serviceUpdates options) =>
          this.watchQuery(options);
}
