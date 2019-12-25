import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/common/binary_packet.dart';

/// Базовый канальный пакет
abstract class Rtu327Frame extends BinaryPacket {
  // Начальный байт
  static const int START_BYTE = 0x02;

  /// Порядковый номер пакета
  final int frameId;

  /// Конструктор
  Rtu327Frame(this.frameId);

  /// Преобразует пакет в байты
  @override
  BinaryData toBytes() {
    final res = BinaryData();
    res.writeUInt8(START_BYTE);
    return res;
  }
}
