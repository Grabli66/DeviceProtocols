import 'package:binary_data/binary_data.dart';
import 'package:binary_data/src/binary_data.dart';
import 'package:device_protocols/common/binary_packet.dart';

/// Бинарный пакет в виде области памяти заполненой байтами
class RawBinaryPacket extends BinaryPacket {
  /// Бинарные данные
  final BinaryData binary;

  /// Конструктор
  RawBinaryPacket(this.binary);

  /// Возвращает байты
  @override
  BinaryData toBytes() {
    return binary;
  }
}
