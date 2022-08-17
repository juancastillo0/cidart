import 'package:jaspr_bootstrap/hooks.dart';
import 'package:mobx/mobx.dart' show mainContext;
// ignore: implementation_imports
import 'package:mobx/src/core.dart' show ReactionImpl;

void useAutorun2(
  void Function() func, {
  String? name,
  // ReactiveContext? context,
  Duration? delay,
  List<Object?> keys = const [],
  // void Function(Object, Reaction)? onError,
}) {
  final _func = useRef(() => func);
  late final ReactionImpl reaction;
  reaction = useRef<ReactionImpl>(
    () {
      final _name = name ?? mainContext.nameFor('useAutorun2');
      return ReactionImpl(
        mainContext,
        () {
          reaction.track(() {
            _func.value();
          });
        },
        name: _name,
        onError: (err, stackTrace) =>
            print('useAutorun2 $_name $err $stackTrace'),
      );
    },
  ).value;

  useEffect(() {
    reaction.track(func);
    _func.value = func;
    return null;
  }, keys);

  useEffect(
    () => reaction.dispose,
    const [],
  );
}
