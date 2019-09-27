import 'package:binary_data/binary_data_lib.dart';

/// Базовый бинарный фрэйм канального протокола
abstract class BinaryChannelFrame {
  /// Преобразует пакет в байты
  BinaryData toBytes();

  /// Преобразует в HEX строку
  String toHex() {
    return toBytes().toHex();
  }
}
