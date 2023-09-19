import 'dart:math';

class GUIDGen {
  static const String chars = '0123456789abcdef';
  static String generate() {
    Random random = Random(DateTime.now().millisecond);

    final uuid = List.filled(36, '');

    for (int i = 0; i < 36; i++) {
      final hexPos = random.nextInt(16);
      final hexChar = chars[hexPos];
      uuid[i] = hexChar;
    }

    var hexValue = uuid[19];
    int decimalValue;

    try {
      decimalValue = int.parse(hexValue, radix: 16);
    } catch (e) {
      decimalValue = 0;
    }

    final pos = (decimalValue & 0x3) | 0x8;
    final char = chars[pos];

    uuid[14] = '4';

    uuid[19] = char;

    uuid[8] = uuid[13] = uuid[18] = uuid[23] = '-';

    final StringBuffer buffer = StringBuffer();
    buffer.writeAll(uuid);
    return buffer.toString();
  }
}
