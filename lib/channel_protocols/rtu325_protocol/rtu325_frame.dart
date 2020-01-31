import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/common/binary_packet.dart';

/// Базовый канальный пакет протокола RTU-325
abstract class RTU325Frame extends BinaryPacket {
  /// Начальный байт
  static const StartByte = 0x02;

  /// Идентификатор пакета
  final int packetId;

  /// Адрес устройства
  final int address;  

  /// Признак что используется компрессия
  final bool compressed;

  /// Признак что используется шифрование
  final bool encrypted;

  /// Конструктор
  RTU325Frame(this.packetId, this.address, {this.compressed, this.encrypted});

  /// Преобразует пакет в байты
  @override
  BinaryData toBytes() {
    final res = BinaryData();
    res.writeUInt8(StartByte);

    final crcPacket = BinaryData();
    crcPacket.writeUInt16(packetId);
    crcPacket.writeUInt16(address);
    final compression = compressed ? 1 : 0;
    crcPacket.writeInt8(compression);
    final encryption = encrypted ? 1 : 0;
    crcPacket.writeInt8(encryption);

    return res;
  }
}
