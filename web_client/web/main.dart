import 'package:jaspr/jaspr.dart';
import 'package:mobx/mobx.dart';
import 'package:web_client/app.dart';

void main() {
  mainContext.config = mainContext.config.clone(
    writePolicy: ReactiveWritePolicy.never,
  );
  runApp(App());
}
