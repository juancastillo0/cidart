import 'compiler_models.dart';
import 'compiler_store.dart';
import 'prelude.dart';

class CompilerDashboardView extends StatelessObserverComponent {
  const CompilerDashboardView({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final gitRepo = useTextInput('juancastillo0/room_signals');
    final gitBranch = useTextInput('main');
    final store = context.pod(DashboardStore.pod);
    final cliCommands = store.cliCommands;

    useComputed(() {
      print(cliCommands.toList());
    });

    yield Col(cross: AxisAlign.stretch, [
      div(key: Key('gitInputs'), [
        label(
          attributes: {'for': 'gitRepo'},
          [Text('Git Repo')],
        ),
        input(
          id: 'gitRepo',
          type: InputType.text,
          value: gitRepo.value,
          events: gitRepo.events,
          styles: Styles.raw({'width': '200px'}),
          [],
        ),
        label(
          attributes: {'for': 'gitBranch'},
          [Text('Git Branch')],
        ),
        input(
          id: 'gitBranch',
          type: InputType.text,
          value: gitBranch.value,
          events: gitBranch.events,
          [],
        ),
      ]),
      Row(main: AxisAlign.space_between, [
        h2([Text('Commands')]),
        button(
          id: 'addCommand',
          events: {
            'click': (_) {
              cliCommands.add(CliCommand());
            }
          },
          [Text('Add')],
        ),
      ]),
      div(key: Key('commands'), [
        ...cliCommands.mapIndexed(
          (i, e) => CliCommandInput(
            key: ValueKey(e),
            // onChanged: (newValue) => cliCommands[i] = newValue,
            value: e,
            onRemove: store.removeCommand,
          ),
        ),
      ]),
      Row(main: AxisAlign.space_between, [
        h2([Text('Logs')])
      ]),
      div(key: Key('logs'), [
        ...compilations.map(
          (e) => CompilationView(
            key: ValueKey(e),
            value: e,
          ),
        ),
      ]),
      Space.vMid,
    ]);
  }
}

class DateString extends StatelessObserverComponent {
  const DateString(this.value, {super.key});

  final DateTime value;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield span(
      styles: Styles.raw({
        'font-size': '0.9em',
        'font-family': 'monospace',
      }),
      [Text(value.toString().split('.').first)],
    );
  }
}

class CompilationView extends StatelessObserverComponent {
  const CompilationView({
    super.key,
    required this.value,
    this.onRemove,
  });

  final Compilation value;
  final void Function(Compilation)? onRemove;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield Col(
        cross: AxisAlign.stretch,
        styles: Styles.raw({
          'padding': '10px',
          'background': '#fafafa',
          'margin-bottom': '12px',
          'border-radius': '10px',
        }),
        [
          Row(main: AxisAlign.space_between, [
            h3(
              styles: Styles.raw({'margin': '4px'}),
              [Text('${value.gitRepo}/${value.gitBranch}')],
            ),
            span([Text(value.status.name)]),
          ]),
          Row([
            span([Text('commit: ${value.commitHash}')]),
          ]),
          Space.vSmall,
          Row(main: AxisAlign.space_between, [
            span(
              styles: Styles.raw({'font-family': 'monospace'}),
              [Text(value.serverFile)],
            ),
            DateString(value.startTime),
            if (value.endTime != null) DateString(value.endTime!),
          ]),
          h4([Text('Logs')]),
          div(styles: Styles.raw({'border-left': 'rgba(0,0,0,0.3) solid 1px'}), [
            ...value.logs.map(
              (e) => div(
                styles: Styles.raw({
                  'padding': '10px',
                  'border-bottom': 'rgba(0,0,0,0.3) solid 1px'
                }),
                [
                  Row([
                    span(
                      styles: Styles.raw({'flex': '1'}),
                      [Text(e.message)],
                    ),
                    DateString(e.time),
                  ]),
                  if (e.command != null)
                    CommandExecutionView(value: e.command!),
                ],
              ),
            ),
          ]),
        ]);
  }
}

class CommandExecutionView extends StatelessObserverComponent {
  const CommandExecutionView({
    super.key,
    required this.value,
  });

  final CommandExecution value;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final command = value.command;
    final result = value.result;

    yield Col([
      h4(
        styles: Styles.raw({'margin': '5px 0 0px', 'align-self': 'start'}),
        [Text('command')],
      ),
      Row(
        styles: Styles.raw({'width': '100%'}),
        main: AxisAlign.space_between,
        [
          span([Text(command.name)]),
          span([Text(value.status.name)]),
          span([Text('${value.duration.inSeconds}s')]),
          DateString(value.endTime),
        ],
      ),
      Row([
        span(
          styles: Styles.combine([
            Styles.box(
              padding: EdgeInsets.all(Unit.pixels(10)),
              margin: EdgeInsets.all(Unit.pixels(10)),
            ),
            Styles.raw({
              'border-radius': '6px',
              'background': '#eaf0f4',
              'font-family': 'monospace',
            }),
          ]),
          [Text(command.command)],
        ),
      ]),
      if (result != null)
        Col([
          Row([
            span([Text('ExitCode: ${result.exitCode}')]),
            Space.hSmall,
            span([Text('PID: ${result.pid}')]),
          ]),
          if (result.stderr.isNotEmpty) ...[
            h3([Text('Error')]),
            Text(result.stderr),
          ],
          if (result.stdout.isNotEmpty) ...[
            h3([Text('Output')]),
            Text(result.stdout),
          ],
        ]),
    ]);
  }
}

class CliCommandInput extends StatelessObserverComponent {
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

    useComputed(() {
      value.name = name.value;
      value.command = command.value;
    });

    yield Row(cross: AxisAlign.end, [
      Col([
        label(htmlFor: '${value.hashCode}-name', [Text('ID')]),
        input(
          id: '${value.hashCode}-name',
          type: InputType.text,
          value: name.value,
          events: name.events,
          styles: Styles.raw({'width': '120px'}),
          [],
        ),
      ]),
      Space.hSmall,
      div(styles: Styles.raw({'flex': '1', 'padding': ''}), [
        Col([
          label(htmlFor: '${value.hashCode}-command', [Text('Command')]),
          input(
            id: '${value.hashCode}-command',
            type: InputType.text,
            value: command.value,
            events: command.events,
            styles: Styles.box(width: Unit.percent(100)),
            [],
          ),
        ]),
      ]),
      button(
        key: Key('clear'),
        events: {
          'click': (_) {
            command.value = '';
          }
        },
        [Text('Clear')],
      ),
      if (onRemove != null) ...[
        Space.hSmall,
        button(
          key: Key('remove'),
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

// class CliCommandInput extends StatelessObserverComponent {
//   const CliCommandInput({
//     super.key,
//     required this.value,
//     required this.onChanged,
//   });

//   final String value;
//   final void Function(String) onChanged;

//   @override
//   Iterable<Component> build(BuildContext context) sync* {
//     final text = useTextInput(value);

//     useEffect(() {
//       text.value = value;
//       return null;
//     }, [value]);

//     useEffect(() {
//       return reaction<String>((_) => text.value, onChanged);
//     }, [onChanged]);

//     yield div(
//       attributes: {'style': flexStyle(column: false)},
//       [
//         input(
//           type: InputType.text,
//           value: text.value,
//           events: text.events,
//           [],
//         ),
//         button(
//           key: Key('clear'),
//           events: {
//             'click': (_) {
//               text.value = '';
//             }
//           },
//           [Text('Clear')],
//         ),
//       ],
//     );
//   }
// }
