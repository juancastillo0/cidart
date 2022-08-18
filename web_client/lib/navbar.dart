import 'package:bootstrap_dart/bootstrap/bootstrap_core.dart';
import 'package:bootstrap_dart/bootstrap/checks_radios.dart';
import 'package:bootstrap_dart/bootstrap/form.dart';
import 'package:bootstrap_dart/bootstrap/icons.dart';
import 'package:bootstrap_dart/bootstrap/navbar.dart';
import 'package:web_client/compiler_store.dart';
import 'package:web_client/prelude.dart';
import 'package:web_client/src/theme.dart';

class AppNavbar extends StatelessComponent {
  const AppNavbar({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final store = context.pod(DashboardStore.pod);

    yield navbar(
      expand: ResponsiveBreakPoint.md,
      brand: [Text('CIDart')],
      position: NavbarPosition.sticky_top,
      collapseId: 'nav-bar-collapse',
      // background: BColor.dark,
      // dark: true,
      // navbarClass: 'bg-transparent',
      attributes: {
        'style': 'background:${BTheme.modeColor};',
        // inDarkMode.value
        //     ? 'background:var(--bs-dark);' // bs-body-bg-alt
        //     : 'background:var(--bs-light);', //  var(--bs-body-bg-alt) white-alt
      },
      itemList: [
        select(
          id: 'compilerService',
          styles: Styles.raw({'width': '200px'}),
          classes: [formSelectClass(), 'ms-auto', 'me-2'],
          events: {
            'change': (e) {
              store.selectedService.value = e.target.value;
            }
          },
          [
            ...store.services.map(
              (element) => option(
                selected: store.selectedService.value == element,
                value: element,
                [Text(element)],
              ),
            )
          ],
        ),
        div(
          classes: ['d-flex'],
          [
            label(
              attributes: {
                'style': 'margin-bottom:3px;',
                'for': 'darkmode-switch',
              },
              [Text('Dark')],
            ),
            check(
              id: 'darkmode-switch',
              type: CheckType.switch_,
              checked: BTheme.inDarkMode,
              onChange: (_) {
                BTheme.toggleDarkMode();
              },
            ),
          ],
        ),
        a(
          href: 'https://github.com/juancastillo0/cidart',
          [
            icon(
              BIcon.github,
              fontSize: '1.7em',
              style: 'margin-left:8px;margin-right:8px;',
            ),
          ],
        ),
      ],
    ) as Component;
  }
}
