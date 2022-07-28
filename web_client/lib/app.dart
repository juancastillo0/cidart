import 'package:jaspr/html.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr/styles.dart';
import 'package:mobx/mobx.dart';
import 'package:collection/collection.dart';
import 'package:web_client/flex.dart';
import 'package:web_client/hooks.dart';

import 'mobx_hooks.dart';

class App extends StatelessObserverComponent {
  const App({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final auth = useTextInput('dwd');
    final deployments = useMemo(
      () {
        mainContext.config = mainContext.config.clone(
          writePolicy: ReactiveWritePolicy.never,
        );
        return ObservableMap.of({
          'nuiawy28vdw': ['dwdaa'],
          'nuiaawwy28vdw': ['dwdaa', 'oii29dh29'],
        });
      },
    );
    final selectedDeployment = useTextInput(deployments.keys.first);
    final deployment = useComputed(
      () => deployments[selectedDeployment.value]!,
    );
    const labelPadding = Styles.box(
      padding: EdgeInsets.symmetric(horizontal: Unit.pixels(10)),
    );
    final gitRepo =
        useTextInput('https://github.com/juancastillo0/room_signals');
    final gitBranch = useTextInput('main');
    final cliCommands = useMemo(
      () => ObservableList.of(['ddwam  daownd oiw', 'ndowa owand anow']),
    );

    yield div(
      attributes: {'style': flexStyle(column: true)},
      [
        div(
          attributes: {'style': flexStyle(column: false)},
          [
            label(
              styles: labelPadding,
              attributes: {'for': 'authorization'},
              [Text('Authorization')],
            ),
            input(
              id: 'authorization',
              type: InputType.text,
              value: auth.value,
              events: auth.events,
              [],
            ),
            button(
              id: 'refresh',
              events: {
                'click': (_) {
                  print('dwd');
                  auth.value = 'kk';
                }
              },
              [Text('Refresh')],
            ),
            label(
              styles: labelPadding,
              attributes: {'for': 'selectedDeployment'},
              [Text('Commit Hash')],
            ),
            select(
              id: 'selectedDeployment',
              events: selectedDeployment.events,
              [
                ...deployments.keys.map(
                  (e) => option(
                    selected: e == selectedDeployment.value,
                    label: e,
                    value: e,
                    [],
                  ),
                )
              ],
            ),
          ],
        ),
        h3([Text('Output')]),
        div([
          ...deployment.map(
            (e) => div(
              styles: Styles.box(padding: EdgeInsets.all(Unit.pixels(12))),
              [Text(e)],
            ),
          ),
        ]),
        div([
          ...cliCommands.mapIndexed(
            (i, e) => CliCommandInput(
              onChanged: (newValue) => cliCommands[i] = newValue,
              value: e,
            ),
          ),
        ]),
      ],
    );
  }
}

T useComputed<T>(
  T Function() func, [
  List<Object?> keys = const [],
]) {
  // final v = useRef<T?>(() => null);
  // final cancel = useMemo(() {
  //   return autorun((_) {
  //     v.value = func();
  //   });
  // }, [keys]);
  // final prevCancel = usePrevious(cancel);

  // useEffect(() {
  //   return () {
  //     prevCancel?.call();
  //   };
  // }, [prevCancel]);

  // return v.value as T;

  final comp = useMemo(() => Computed(func), keys);
  return comp.value;
}

TextInput useTextInput([String initialText = '']) {
  final obs = useObs(() => initialText);
  final obsInput = useRef<Object?>(() => null);
  useEffect(() {
    if (obsInput.value != null) {
      (obsInput.value as dynamic).value = obs.value;
    }
    return null;
  }, [obsInput.value, obs.value]);

  final events = {
    'input': (e) {
      obsInput.value = e.target;
      obs.value = e.target.value!;
    }
  };

  return TextInput(events: events, obs: obs);
}

class TextInput {
  final Obs<String> obs;
  final Map<String, void Function(Object?)> events;

  TextInput({
    required this.obs,
    required this.events,
  });

  String get value => obs.value;
  set value(String newValue) => obs.value = newValue;
}

class CliCommandInput extends StatelessObserverComponent {
  const CliCommandInput({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final String value;
  final void Function(String) onChanged;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final text = useTextInput(value);

    useEffect(() {
      text.value = value;
      return null;
    }, [value]);

    useEffect(() {
      return reaction<String>((_) => text.value, onChanged);
    }, [onChanged]);

    yield div(
      attributes: {'style': flexStyle(column: false)},
      [
        input(
          type: InputType.text,
          value: text.value,
          events: text.events,
          [],
        ),
        button(
          key: Key('clear'),
          events: {
            'click': (_) {
              text.value = '';
            }
          },
          [Text('Clear')],
        ),
      ],
    );
  }
}
