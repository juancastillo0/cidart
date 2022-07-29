import 'compiler_models.dart';
import 'store_prelude.dart';

// Include generated file
part 'compiler_store.g.dart';

class DashboardStore {
  final ObservableList<CliCommand> cliCommands = ObservableList();

  static final pod = Pod(
    isGlobal: true,
    dispose: (value) {},
    create: (scope) => DashboardStore(),
  );

  void removeCommand(CliCommand command) {
    cliCommands.remove(command);
  }
}

class CliCommand extends _CliCommand with _$CliCommand {}

abstract class _CliCommand with Store {
  String name = '';
  String command = '';
  DateTime modifiedDate = DateTime.now();
  final ObservableMap<String, CliCommandVariable> variables = ObservableMap();

  // _CliCommand({
  //   required this.command,
  //   required this.name,
  //   required this.modifiedDate,
  //   this.variables = const {},
  // });
}
