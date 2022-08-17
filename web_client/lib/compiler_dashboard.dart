import 'package:bootstrap_dart/bootstrap/bootstrap_core.dart';
import 'package:bootstrap_dart/bootstrap/icons.dart';
import 'package:bootstrap_dart/bootstrap/modal.dart';
import 'package:jaspr_bootstrap/jaspr_bootstrap.dart';
import 'package:web_client/service_compiler_form.dart';

import 'compiler_models.dart';
import 'prelude.dart';

class CompilerDashboardView extends StatelessComponent {
  const CompilerDashboardView({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final modalState = useModal(context.bootstrapCtx);

    yield Col(cross: AxisAlign.stretch, [
      const ServiceCompilerForm(),
      Row(main: AxisAlign.space_between, [
        h2([Text('Logs')]),
        modal(
          id: 'logs-config-modal',
          dialog: modalDialog(
            dialogClass: modalDialogClass(),
            body: [const LogSettingsModal()],
          ),
          modalRef: modalState.ref,
        ),
        button(
          classes: [btn(outlined: true)],
          events: {
            'click': (event) => modalState.toggle(),
          },
          [
            icon(BIcon.sliders, style: 'padding-right:5px;'),
            Text('Config'),
          ],
        )
      ]),
      div(key: Key('logs'), [
        ...compilations.map(
          (e) => CompilationView(
            key: ValueKey(e),
            value: e,
          ),
        ),
      ]),
      AppSpace.vMid,
    ]);
  }
}

class LogSettingsModal extends StatelessComponent {
  const LogSettingsModal({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield span(
      styles: Styles.raw({
        'font-size': '0.9em',
        'font-family': 'monospace',
      }),
      [Text('Show Dates')],
    );
  }
}

class DateString extends StatelessComponent {
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

class CompilationView extends StatelessComponent {
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
        AppSpace.vSmall,
        Row(main: AxisAlign.space_between, [
          span(
            styles: Styles.raw({'font-family': 'monospace'}),
            [Text(value.serverFile)],
          ),
          DateString(value.startTime),
          if (value.endTime != null) DateString(value.endTime!),
        ]),
        h4([Text('Logs')]),
        div(
          styles: Styles.raw({'border-left': 'rgba(0,0,0,0.3) solid 1px'}),
          [
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
          ],
        ),
      ],
    );
  }
}

class CommandExecutionView extends StatelessComponent {
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
            AppSpace.hSmall,
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


// class CliCommandInput extends StatelessComponent {
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
