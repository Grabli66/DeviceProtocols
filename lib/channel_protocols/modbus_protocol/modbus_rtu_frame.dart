import 'dart:typed_data';

import 'package:binary_data/binary_data.dart';
import 'package:binary_data/src/binary_data.dart';
import 'package:device_protocols/common/binary_packet.dart';

/// Базовый канальный пакет протокола Modbus RTU
class ModbusRtuFrame extends BinaryPacket {
  /// Сетевой адрес устройства к которому пакет
  final int networkAddress;

  /// Передаваемые данные
  final Uint8List data;

  /// Конструктор
  ModbusRtuFrame(this.networkAddress, this.data);

  // Преобразует пакет в байты
  @override
  BinaryData toBytes() {
    final res = BinaryData();
    res.writeUInt8(networkAddress);
    res.writeList(data);
    // TODO: расчёт CRC
    return res;
  }
}
