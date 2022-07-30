import 'dart:math' show Random;

const alphabet = 'abcdefghijklmnopqrstuvwxyz';
final alphabetCompleteList =
    '0123456789$alphabet${alphabet.toUpperCase()}'.split('');

final _random = Random();

String randomId({int length = 32, int? seed}) {
  final random = seed == null ? _random : Random(seed);

  return Iterable.generate(
    length,
    (_) => alphabetCompleteList[random.nextInt(alphabetCompleteList.length)],
  ).join();
}
