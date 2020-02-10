import 'dart:typed_data';

import 'package:binary_data/binary_data.dart';
import 'package:binary_data/src/binary_data.dart';
import 'package:device_protocols/channel_protocols/modbus_protocol/modbus_channel_protocol.dart';
import 'package:device_protocols/common/modbus/modbus_function_code.dart';

/// Канальный пакет протокола Modbus RTU
abstract class ModbusRtuFrame extends ModbusFrame {
  /// Сетевой адрес устройства к которому пакет
  final int networkAddress;

  /// Конструктор
  ModbusRtuFrame(
      this.networkAddress, ModbusFunctionCode functionCode, Uint8List payload)
      : super(functionCode, payload);

  // Преобразует пакет в байты
  @override
  BinaryData toBytes() {
    final res = BinaryData();
    res.writeUInt8(networkAddress);
    res.writeUInt8(functionCode.code);
    res.writeList(payload);
    // TODO: расчёт CRC
    return res;
  }
}
