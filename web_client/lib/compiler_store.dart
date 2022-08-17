import 'compiler_models.dart';
import 'store_prelude.dart';

part 'compiler_store.g.dart';

class DashboardStore {
  final ObservableList<String> services =
      ObservableList.of(['oianwd2nd', 'nda0ad2noin']);
  final ObservableList<CliCommand> cliCommands = ObservableList();

  late final Observable<String> selectedService = Observable(services.first);

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
  @observable
  String name = '';
  @observable
  String command = '';
  @observable
  DateTime modifiedDate = DateTime.now();
  final ObservableMap<String, CliCommandVariable> variables = ObservableMap();

  // _CliCommand({
  //   required this.command,
  //   required this.name,
  //   required this.modifiedDate,
  //   this.variables = const {},
  // });
}
