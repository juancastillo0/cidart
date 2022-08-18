import 'package:bootstrap_dart/bootstrap/bootstrap_core.dart';
import 'package:bootstrap_dart/bootstrap/form.dart';
import 'package:web_client/prelude.dart';

import 'compiler_store.dart';

class ServiceCompilerForm extends StatelessComponent {
  const ServiceCompilerForm({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final gitRepo = useTextInput('juancastillo0/room_signals');
    final gitBranch = useTextInput('main');
    final serverFile = useTextInput('bin/server');
    final store = context.pod(DashboardStore.pod);
    final cliCommands = store.cliCommands;

    useComputed(() {
      print(cliCommands.toList());
    });
    // final colClasses = ColInputClasses(input: 'col-9', label: 'col-3');

    yield div([
      div(key: Key('gitInputs'), [
        h3([Text('Service Config')]),
        labeledInput(
          label: Text('Git Repo'),
          id: 'gitRepo',
          wrapperDivClass: 'mb-2',
          // colClasses: colClasses,
          // divClass: 'row',
          input: input(
            id: 'gitRepo',
            type: InputType.text,
            classes: [formControlClass()],
            value: gitRepo.value,
            events: gitRepo.events,
            [],
          ),
        ),
        div(
          classes: ['row'],
          [
            labeledInput(
              label: Text('Git Branch'),
              id: 'gitBranch',
              wrapperDivClass: 'col-md-6 col-12 mb-2',
              // colClasses: colClasses,
              // divClass: 'row',
              input: input(
                id: 'gitBranch',
                type: InputType.text,
                classes: [formControlClass()],
                value: gitBranch.value,
                events: gitBranch.events,
                [],
              ),
            ),
            labeledInput(
              label: Text('Server File'),
              id: 'serverFileExecutable',
              wrapperDivClass: 'col-md-6 col-12 mb-2',
              // colClasses: colClasses,
              // divClass: 'row',
              input: input(
                id: 'serverFileExecutable',
                type: InputType.text,
                classes: [formControlClass()],
                value: serverFile.value,
                events: serverFile.events,
                [],
              ),
            ),
          ],
        ),
      ]),
      Row(
        classes: ['my-4'],
        main: AxisAlign.space_between,
        [
          h3([Text('Commands')]),
          button(
            id: 'addCommand',
            classes: [btn(color: BColor.success)],
            events: {
              'click': (_) {
                cliCommands.add(CliCommand());
              }
            },
            [Text('Add')],
          ),
        ],
      ),
      div(
        key: Key('commands'),
        [
          ...cliCommands.mapIndexed(
            (i, e) => CliCommandInput(
              key: ValueKey(e),
              // onChanged: (newValue) => cliCommands[i] = newValue,
              value: e,
              onRemove: store.removeCommand,
            ),
          ),
          if (cliCommands.isNotEmpty)
            button(
              key: Key('createCommands'),
              classes: [btn(), 'ms-auto', 'my-2'],
              attributes: {'style': 'display:block;'},
              events: {'click': (_) {}},
              [Text('Create')],
            ),
        ],
      ),
    ]);
  }
}

class CliCommandInput extends StatelessComponent {
  const CliCommandInput({
    super.key,
    required this.value,
    this.onRemove,
  });

  final CliCommand value;
  final void Function(CliCommand)? onRemove;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final name = useTextInput(value.name);
    final command = useTextInput(value.command);

    print('build');
    useAutorun2(() {
      print('useAutorun');
      value.name = name.value;
      value.command = command.value;
    });

    yield Row(cross: AxisAlign.end, [
      Col([
        label(htmlFor: '${value.hashCode}-name', [Text('ID')]),
        input(
          id: '${value.hashCode}-name',
          type: InputType.text,
          classes: [formControlClass()],
          value: name.value,
          events: name.events,
          styles: Styles.raw({'width': '120px'}),
          [],
        ),
      ]),
      AppSpace.hSmall,
      div(styles: Styles.raw({'flex': '1', 'padding': ''}), [
        Col([
          label(htmlFor: '${value.hashCode}-command', [Text('Command')]),
          input(
            id: '${value.hashCode}-command',
            type: InputType.text,
            classes: [formControlClass()],
            value: command.value,
            events: command.events,
            styles: Styles.box(width: Unit.percent(100)),
            [],
          ),
        ]),
      ]),
      button(
        key: Key('clear'),
        classes: [btn(outlined: true, color: BColor.secondary)],
        events: {
          'click': (_) {
            command.value = '';
          }
        },
        [Text('Clear')],
      ),
      if (onRemove != null) ...[
        AppSpace.hSmall,
        button(
          key: Key('remove'),
          classes: [btn(color: BColor.danger, outlined: true)],
          events: {
            'click': (_) {
              onRemove!(value);
            }
          },
          [Text('Remove')],
        ),
      ]
    ]);
  }
}
