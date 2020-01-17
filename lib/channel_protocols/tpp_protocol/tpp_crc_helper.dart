import 'package:binary_data/binary_data_lib.dart';

/// Утилита для работы с CRC
class TppCrcHelper {
  /// Таблица CRC
  static const _crcTable = [
    0x00,
    0x07,
    0x0E,
    0x09,
    0x1C,
    0x1B,
    0x12,
    0x15,
    0x38,
    0x3F,
    0x36,
    0x31,
    0x24,
    0x23,
    0x2A,
    0x2D
  ];

  /// Считает CRC16 начиная с [pos] на определённую длинну [len]
  static int calcCrc(BinaryData binary, int pos, int len) {
    var res = 0;
    for (var i = pos; i < pos + len; i++) {
      var b = binary.getUInt8(i);
      res = ((res << 4) ^ _crcTable[((b ^ res) >> 4) & 0x0F]) & 0xFF;
      res = ((res << 4) ^ _crcTable[(((b << 4) ^ res) >> 4) & 0x0F]) & 0xFF;
    }
    return res;
  }
}
