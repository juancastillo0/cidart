import 'package:web_client/compiler_dashboard.dart';

import 'prelude.dart';

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

    yield Col([
      Row([
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
      ]),
      h3([Text('Output')]),
      div([
        ...deployment.map(
          (e) => div(
            styles: Styles.box(padding: EdgeInsets.all(Unit.pixels(12))),
            [Text(e)],
          ),
        ),
      ]),
      const CompilerDashboardView(),
    ]);
  }
}
