import 'dart:math' as math;
import 'package:jaspr/jaspr.dart';
import 'package:mobx/mobx.dart' show Observable, mainContext;
// ignore: implementation_imports
import 'package:mobx/src/core.dart' show ReactionImpl;

abstract class StatelessObserverComponent extends StatelessComponent {
  /// Initializes [key] for subclasses.
  const StatelessObserverComponent({super.key});

  @override
  Element createElement() => StatelessObserverElement(this);
}

class StatelessObserverElement extends StatelessElement {
  StatelessObserverElement(super.component);

  final HookCtx ctx = HookCtx();

  List<Component> _build() => super.build().toList();

  @override
  void unmount() {
    ctx.dispose();
    super.unmount();
  }

  @override
  Iterable<Component> build() {
    final children = mobxWrapper(ctx, markNeedsBuild, _build);
    // TODO: test hook effect execution timing
    ctx._afterRender();
    return children;
  }
}

abstract class StatefulObserverComponent extends StatefulComponent {
  /// Initializes [key] for subclasses.
  const StatefulObserverComponent({super.key});

  @override
  Element createElement() => StatefulObserverElement(this);
}

class StatefulObserverElement extends StatefulElement {
  StatefulObserverElement(super.component);

  final HookCtx ctx = HookCtx();

  List<Component> _build() => super.build().toList();

  @override
  void unmount() {
    ctx.dispose();
    super.unmount();
  }

  @override
  Iterable<Component> build() {
    final children = mobxWrapper(ctx, markNeedsBuild, _build);
    // TODO: test hook effect execution timing
    ctx._afterRender();
    return children;
  }
}

List<Component> mobxWrapper(
  HookCtx ctx,
  void Function() markNeedsBuild,
  List<Component> Function() next,
) {
  final previousCtx = _ctx;
  _ctx = ctx;
  final rxtRef = useRef<ReactionImpl>(
    () => ReactionImpl(
      mainContext,
      () {
        print('${ctx.hashCode} rerender');
        markNeedsBuild();
      },
      name: ctx.hashCode.toString(),
      onError: (err, stackTrace) => print('$err $stackTrace'),
    ),
  );

  useEffect(
    () => rxtRef.value.dispose,
    const [],
  );

  late final List<Component> node;
  rxtRef.value.track(() {
    print('${ctx.hashCode} start-track');
    node = next();
    print('${ctx.hashCode} end-track');
  });
  _ctx = previousCtx;
  return node;
}

class Ref<T> {
  Ref._(this.value);
  T value;
}

typedef Obs<T> = Observable<T>;

/// A function to be called to cleanup an effect.
typedef Cleanup = void Function();

/// An [Effect] is a function to be called when a
/// component was (re)rendered.
typedef Effect = Cleanup? Function();

typedef KeysEquals = bool Function(Object?, Object?);

class HookEffect {
  final Effect effect;
  final List<Object?>? keys;
  final KeysEquals isEqual;
  Cleanup? cleanup;

  HookEffect({
    required this.effect,
    required this.keys,
    required this.isEqual,
  });
}

bool defaultKeysEquals(Object? a, Object? b) => a == b;

HookCtx? _ctx;
HookCtx get ctx {
  assert(_ctx != null, 'Current HookCtx is null ${StackTrace.current}');
  return _ctx!;
}

class HookCtx {
  int? _hookRefIndex;
  final List<Ref> _hookRefs = [];
  int? _hookObsIndex;
  final List<Obs> _hookObs = [];

  List<HookEffect> _hookEffects = [];
  List<HookEffect> _previousHookEffects = [];
  bool _disposed = false;
  bool get disposed => _disposed;
  // bool _rendering = false;
  // bool get rendering => _rendering;

  static bool areKeysDifferent(
    List<Object?>? prevKeys,
    List<Object?>? newKeys,
    KeysEquals isEqual,
  ) {
    int i = 0;
    return newKeys == null ||
        prevKeys == null ||
        (prevKeys.length != newKeys.length ||
            prevKeys.any((e) => !isEqual(e, newKeys[i++])));
  }

  void _afterRender() {
    for (int i = 0;
        i < math.max(_hookEffects.length, _previousHookEffects.length);
        i++) {
      final previous =
          _previousHookEffects.length > i ? _previousHookEffects[i] : null;
      final current = _hookEffects.length > i ? _hookEffects[i] : null;
      if (previous != null && current != null) {
        assert(previous.isEqual == current.isEqual);
        final prevKeys = previous.keys;
        final newKeys = current.keys;

        if (areKeysDifferent(prevKeys, newKeys, current.isEqual)) {
          previous.cleanup?.call();
          current.cleanup = current.effect();
        } else {
          current.cleanup = previous.cleanup;
        }
      } else if (current != null) {
        current.cleanup = current.effect();
      } else if (previous != null) {
        previous.cleanup?.call();
      }
    }

    _previousHookEffects = _hookEffects;
    _hookEffects = [];

    _hookRefIndex = 0;
    _hookObsIndex = 0;
  }

  void dispose() {
    if (disposed) return;
    _disposed = true;
    for (final hook in _previousHookEffects) {
      hook.cleanup?.call();
    }
  }
}

void useEffect(
  Effect effect, [
  List<Object?>? keys,
  KeysEquals isEqual = defaultKeysEquals,
]) {
  final _hook = HookEffect(
    effect: effect,
    keys: keys,
    isEqual: isEqual,
  );
  ctx._hookEffects.add(_hook);
}

Ref<T> useRef<T>(T Function() builder) {
  final Ref<T> ref;
  if (ctx._hookRefIndex == null) {
    ref = Ref._(builder());
    ctx._hookRefs.add(ref);
  } else {
    final _ref = ctx._hookRefs[ctx._hookRefIndex!];
    ref = _ref as Ref<T>;
    ctx._hookRefIndex = ctx._hookRefIndex! + 1;
  }
  return ref;
}

Obs<T> useObs<T>(T Function() builder) {
  final Obs<T> ref;
  if (ctx._hookObsIndex == null) {
    ref = Obs(builder());
    ctx._hookObs.add(ref);
  } else {
    final _ref = ctx._hookObs[ctx._hookObsIndex!];
    ref = _ref as Obs<T>;
    ctx._hookObsIndex = ctx._hookObsIndex! + 1;
  }
  return ref;
}
