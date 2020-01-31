import 'package:binary_data/binary_data.dart';

/// Утилита для работы с CRC
class Usd204CrcHelper {
  /// Считает CRC начиная с [pos] на определённую длинну [len]
  static int calcCrc(BinaryData binary, int pos, int len) {
    var res = 0;
    for (var i = pos; i < pos + len; i++) {
      var b = binary.getUInt8(i);
      res ^= b;
    }
    return res;
  }
}
