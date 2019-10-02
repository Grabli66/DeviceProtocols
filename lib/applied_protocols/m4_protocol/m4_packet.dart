import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/common/binary_packet.dart';

/// Прикладной пакет в протоколе M4
abstract class M4Packet extends BinaryPacket {
  /// Идентификатор функции
  final int functionId;

  /// Конструктор
  M4Packet(this.functionId);

  /// Преобразует пакет в байты
  @override
  BinaryData toBytes() {
    final binary = BinaryData();
    binary.writeUInt8(functionId);
    return binary;
  }
}
