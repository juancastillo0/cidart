import 'package:jaspr/jaspr.dart';
import 'package:mobx/mobx.dart';
import 'package:web_client/app.dart';
import 'package:web_client/pod_scope.dart';

void main() {
  mainContext.config = mainContext.config.clone(
    writePolicy: ReactiveWritePolicy.never,
  );
  runApp(PodScopeWidget(child: App()));
}
