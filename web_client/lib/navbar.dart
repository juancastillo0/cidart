import 'package:bootstrap_dart/bootstrap/bootstrap_core.dart';
import 'package:bootstrap_dart/bootstrap/form.dart';
import 'package:bootstrap_dart/bootstrap/icons.dart';
import 'package:bootstrap_dart/bootstrap/navbar.dart';
import 'package:web_client/compiler_store.dart';
import 'package:web_client/prelude.dart';

class AppNavbar extends StatelessComponent {
  const AppNavbar({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final store = context.pod(DashboardStore.pod);

    yield navbar(
      expand: ResponsiveBreakPoint.md,
      brand: [Text('CIDart')],
      position: NavbarPosition.sticky_top,
      background: BColor.light,
      itemList: [
        select(
          id: 'compilerService',
          styles: Styles.raw({'width': '200px'}),
          classes: [formSelectClass(), 'ms-auto', 'me-4'],
          events: {
            'onchange': (e) {
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
        a(
          href: 'https://github.com/juancastillo0/cidart',
          [icon(BIcon.github, fontSize: '1.7em')],
        ),
      ],
    ) as Component;
  }
}
