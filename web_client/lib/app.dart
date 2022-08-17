import 'package:bootstrap_dart/bootstrap/bootstrap_core.dart';
import 'package:bootstrap_dart/bootstrap/form.dart';
import 'package:jaspr_bootstrap/jaspr_bootstrap.dart';
import 'package:web_client/compiler_dashboard.dart';

import 'navbar.dart';
import 'prelude.dart';

class App extends StatelessComponent {
  const App._({super.key});

  static Component render() {
    JasprBootstrapRenderer.setUp();
    mainContext.config = mainContext.config.clone(
      writePolicy: ReactiveWritePolicy.never,
    );
    return MobXHooksObserverComponent(
      child: PodScopeWidget(
        child: App._(),
      ),
    );
  }

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

    yield Col(cross: AxisAlign.stretch, [
      const AppNavbar(),
      div(classes: [
        'container'
      ], [
        Row([
          labeledInput(
            label: Text('Authorization'),
            id: 'authorization',
            input: input(
              id: 'authorization',
              classes: [formControlClass()],
              type: InputType.text,
              value: auth.value,
              events: auth.events,
              [],
            ),
          ),
          button(
            id: 'refresh',
            classes: [btn()],
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
      ]),
    ]);
  }
}
