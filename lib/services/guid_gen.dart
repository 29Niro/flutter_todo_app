import 'dart:math';

class GUIDGen {
  static String generate() {
    Random random = Random(DateTime.now().millisecond);

    const String chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final List<String> uuid = List.filled(36, '', growable: true);

    for(int i=0; i<36; i++){
      final int hexPos = random.nextInt(16);
      uuid[i] = (chars.substring(hexPos, hexPos+1));
    }

    int pos = (int.parse(uuid[19], radix: 16) & 0x3) | 0x8;

    uuid[14] = '4';
    uuid[19] = chars.substring(pos, pos+1);

    uuid[8] = uuid[13] = uuid[18] = uuid[23] = '-';

    final StringBuffer buffer = StringBuffer();
    buffer.writeAll(uuid);
    return buffer.toString();
  }
}
