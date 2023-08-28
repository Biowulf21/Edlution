import 'dart:math';

void main(List<String> args) {
  final uuid = UUIDGenerator.generate();
  print(uuid);
}

class UUIDGenerator {
  static String generate() {
    final random = Random();
    final codeUnits = List.generate(20, (index) {
      final isUppercase = random.nextBool();
      final start = isUppercase ? 65 : 97;
      final end = isUppercase ? 90 : 122;
      return random.nextInt(end - start + 1) + start;
    });

    return String.fromCharCodes(codeUnits);
  }
}
