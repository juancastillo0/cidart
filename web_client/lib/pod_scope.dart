import 'dart:async';

import 'prelude.dart';

class PodScopeWidget extends StatelessObserverComponent {
  const PodScopeWidget({
    required this.child,
    this.overrides,
    super.key,
  });

  final List<PodOverride>? overrides;
  final Component child;

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final podScope = useRef(
      () => PodScope(
        parent: _InheritedPodScope.get(context),
        overrides: overrides,
      ),
    ).value;
    useEffect(() => podScope.dispose, const []);

    yield _InheritedPodScope(
      podScope: podScope,
      child: child,
    );
  }
}

class _InheritedPodScope extends InheritedComponent {
  final PodScope podScope;
  _InheritedPodScope({required this.podScope, required super.child});

  @override
  bool updateShouldNotify(_InheritedPodScope oldComponent) {
    return podScope != oldComponent.podScope;
  }

  static PodScope? get(BuildContext context) {
    final element = context
        .getElementForInheritedComponentOfExactType<_InheritedPodScope>();
    if (element == null) return null;
    return (element.component as _InheritedPodScope).podScope;
  }
}

extension PodScopeBuildContext on BuildContext {
  T pod<T>(Pod<T> pod) => _InheritedPodScope.get(this)!.get(pod);
}

class PodScope {
  final PodScope? parent;
  final Map<Pod, Object?> _values = {};

  PodScope({this.parent, List<PodOverride>? overrides}) {
    if (overrides != null) {
      for (final o in overrides) {
        _values[o.pod] = o.create(this);
      }
    }
  }

  Iterable<PodScope> parents() sync* {
    PodScope? parent = this.parent;
    while (parent != null) {
      yield parent;
      parent = parent.parent;
    }
  }

  T get<T>(Pod<T> pod) {
    if (_values.containsKey(pod)) {
      return _values[pod] as T;
    }
    for (final p in parents()) {
      if (p._values.containsKey(pod)) {
        return p._values[pod] as T;
      }
    }

    final value = pod.create(this);
    _values[pod] = value;
    if (pod.isGlobal) {
      for (final p in parents()) {
        p._values[pod] = value;
      }
    }
    return value;
  }

  Future<void> dispose() async {
    await Future.wait(
      _values.entries.map((e) async {
        if (parent == null || !e.key.isGlobal) {
          await e.key.dispose(e.value);
        }
      }),
    );
  }
}

class Pod<T> {
  final T Function(PodScope scope) create;
  final bool isGlobal;
  final FutureOr<void> Function(T value) dispose;

  Pod({
    required this.create,
    required this.isGlobal,
    required this.dispose,
  });
}

class PodOverride<T> {
  final Pod<T> pod;
  final T Function(PodScope scope) create;

  PodOverride({
    required this.pod,
    required this.create,
  });
}
