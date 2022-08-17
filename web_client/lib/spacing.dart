import 'prelude.dart';

class AppSpace {
  const AppSpace._();
  static final hSmall = span(styles: Styles.box(width: Unit.pixels(10)), []);
  static final vSmall = span(styles: Styles.box(height: Unit.pixels(10)), []);
  static final hMid = span(styles: Styles.box(width: Unit.pixels(20)), []);
  static final vMid = span(styles: Styles.box(height: Unit.pixels(20)), []);
}
