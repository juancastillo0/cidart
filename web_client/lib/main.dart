import 'package:jaspr/jaspr.dart';
import 'package:mobx/mobx.dart';

import 'app.dart';
import 'pod_scope.dart';

void main() {
  mainContext.config = mainContext.config.clone(
    writePolicy: ReactiveWritePolicy.never,
  );
  runApp(PodScopeWidget(child: App()));
}
