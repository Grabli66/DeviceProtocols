import 'package:binary_data/binary_data_lib.dart';

/// Базовый канальный пакет
abstract class Frame {
  // Начальный байт
  static const int START_BYTE = 0x02;

  /// Порядковый номер пакета
  final int frameId;

  /// Конструктор
  const Frame(this.frameId);

  /// Преобразует пакет в байты
  BinaryData toBytes() {
    final res = BinaryData();
    res.writeUInt8(START_BYTE);
    return res;
  }

  /// Преобразует в HEX строку
  String toHex() {
    return toBytes().toHex();
  }
}
