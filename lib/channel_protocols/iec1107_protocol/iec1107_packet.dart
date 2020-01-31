import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/common/binary_packet.dart';

/// Базовый пакет протокола IEC1107
abstract class IEC1107Packet extends BinaryPacket {
  /// Переводит в байты
  BinaryData toBytes();

  /// Возвращает запрос в виде строки
  @override
  String toString() {
    return toBytes().toString();
  }
}
