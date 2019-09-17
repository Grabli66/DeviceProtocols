import 'package:binary_data/binary_data_lib.dart';

/// Базовый бинарный пакет
abstract class BinaryPacket {
  /// Возвращает пакет в виде байт
  BinaryData toBytes();

  /// Возвращает HEX строку из байт пакета
  String toHex() {
    return toBytes().toHex();
  }
}