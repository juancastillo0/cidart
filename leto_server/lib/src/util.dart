import 'dart:math' show Random;

import 'package:leto_schema/leto_schema.dart' show ScopedRef;

const alphabet = 'abcdefghijklmnopqrstuvwxyz';
final alphabetCompleteList =
    '0123456789$alphabet${alphabet.toUpperCase()}'.split('');

final _random = Random();

String randomId({int length = 32, Random? random}) {
  final r = random ?? _random;

  return Iterable.generate(
    length,
    (_) => alphabetCompleteList[r.nextInt(alphabetCompleteList.length)],
  ).join();
}

final randomRef = ScopedRef.global((scope) => Random());
