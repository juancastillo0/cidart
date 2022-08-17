// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compiler_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CliCommand on _CliCommand, Store {
  late final _$nameAtom = Atom(name: '_CliCommand.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$commandAtom =
      Atom(name: '_CliCommand.command', context: context);

  @override
  String get command {
    _$commandAtom.reportRead();
    return super.command;
  }

  @override
  set command(String value) {
    _$commandAtom.reportWrite(value, super.command, () {
      super.command = value;
    });
  }

  late final _$modifiedDateAtom =
      Atom(name: '_CliCommand.modifiedDate', context: context);

  @override
  DateTime get modifiedDate {
    _$modifiedDateAtom.reportRead();
    return super.modifiedDate;
  }

  @override
  set modifiedDate(DateTime value) {
    _$modifiedDateAtom.reportWrite(value, super.modifiedDate, () {
      super.modifiedDate = value;
    });
  }

  @override
  String toString() {
    return '''
name: ${name},
command: ${command},
modifiedDate: ${modifiedDate}
    ''';
  }
}
