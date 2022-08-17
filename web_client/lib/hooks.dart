// void useAutorun(
//   void Function(Reaction) func, {
//   String? name,
//   ReactiveContext? context,
//   Duration? delay,
//   List<Object?> keys = const [],
//   void Function(Object, Reaction)? onError,
// }) {
//   useEffectSync(() {
//     return autorun(
//       func,
//       name: name,
//       context: context,
//       delay: delay?.inMilliseconds,
//       onError: onError,
//     ).call;
//   }, keys);
// }

// // TODO:
// // readContext<T>(context: ReactContext<T>): T,
// // useContext<T>(context: ReactContext<T>): T,
// // useEffect(
// //   create: () => (() => void) | void,
// //   deps: Array<mixed> | void | null,
// // ): void,
// // useInsertionEffect(
// //   create: () => (() => void) | void,
// //   deps: Array<mixed> | void | null,
// // ): void,
// // useLayoutEffect(
// //   create: () => (() => void) | void,
// //   deps: Array<mixed> | void | null,
// // ): void,
// // useSyncExternalStore<T>(
// //   subscribe: (() => void) => () => void,
// //   getSnapshot: () => T,
// //   getServerSnapshot?: () => T,
// // ): T,
