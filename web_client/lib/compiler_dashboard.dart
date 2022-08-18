import 'package:bootstrap_dart/bootstrap/bootstrap_core.dart';
import 'package:bootstrap_dart/bootstrap/checks_radios.dart';
import 'package:bootstrap_dart/bootstrap/form.dart';
import 'package:bootstrap_dart/bootstrap/icons.dart';
import 'package:bootstrap_dart/bootstrap/modal.dart';
import 'package:jaspr_bootstrap/jaspr_bootstrap.dart';
import 'package:web_client/service_compiler_form.dart';
import 'package:web_client/src/theme.dart';

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
    final showDateInput = useObs(() => true);
    final horizontalInput = useObs(() => false);
    final authInput = useObs(() => '');

    yield span(
      [
        completeForm(
          horizontal: horizontalInput.value,
          values: [
            InputValue(
              id: 'showDateInput',
              type: InputType.checkbox,
              onValueChange: (newValue) {
                showDateInput.value = !showDateInput.value;
              },
              value: showDateInput.value.toString(),
            ),
            InputValue(
              id: 'horizontalInput',
              type: InputType.checkbox,
              onValueChange: (newValue) {
                horizontalInput.value = !horizontalInput.value;
              },
              value: horizontalInput.value.toString(),
            ),
            InputValue(
              id: 'authInput',
              type: InputType.text,
              onValueChange: authInput.set,
              value: authInput.value,
            ),
          ],
        ),
      ],
    );
  }
}

class InputValue {
  final String id;
  final String value;
  final void Function(String newValue) onValueChange;
  final InputType type;
  final InputFeedback? feedback;

  InputValue({
    required this.id,
    required this.value,
    required this.onValueChange,
    this.type = InputType.text,
    this.feedback,
  });
}

Component completeForm({
  required List<InputValue> values,
  bool horizontal = true,
}) {
  const colClasses = ColInputClasses(
    label: 'col-sm-4 col-lg-3',
    input: 'col-sm-8 col-lg-9 d-flex align-items-center',
  );

  return div(
    classes: horizontal ? [] : ['d-flex', 'flex-wrap'],
    [
      ...values.map(
        (e) => bsInput(
          inputValue: e,
          colClasses: horizontal ? colClasses : null,
          divClass: horizontal ? null : 'flex-grow-1 min-width-200 d-flex',
        ),
      )
    ],
  );
}

Component bsInput({
  required InputValue inputValue,
  ColInputClasses? colClasses,
  String? divClass,
}) {
  final isCheck =
      const [InputType.checkbox, InputType.radio].contains(inputValue.type);
  return labeledInput(
    label: Text(inputValue.id),
    feedback: inputValue.feedback,
    colClasses: colClasses,
    divClass: divClass ?? (colClasses != null ? 'row' : null),
    floating: colClasses == null && !isCheck,
    wrapperDivClass: colClasses != null ? 'my-2' : null,
    id: inputValue.id,
    input: isCheck
        ? check(
            id: inputValue.id,
            // label: Text(inputValue.id),
            feedback: inputValue.feedback,
            checked: inputValue.value == 'true',
            type: inputValue.type == InputType.checkbox
                ? CheckType.checkbox
                : CheckType.radio,
            onChange: ((enabled) {
              inputValue.onValueChange(enabled.toString());
            }),
          )
        : input(
            id: inputValue.id,
            type: inputValue.type,
            value: inputValue.value,
            classes: [formControlClass()],
            events: {'input': (e) => inputValue.onValueChange(e.target.value)},
            [],
          ),
  );
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
        'background': BTheme.modeColor, // BTheme.bodyBg,
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
              'background': BTheme.modeDarkerColor, // '#eaf0f4',
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
