import 'dart:typed_data';

import 'package:device_protocols/common/binary_packet.dart';
import 'package:device_protocols/common/modbus/modbus_function_code.dart';

/// Базовый канальный пакет протокола Modbus
abstract class ModbusFrame extends BinaryPacket {
  /// Код функции
  final ModbusFunctionCode functionCode;

  // Полезные данные паке
  final Uint8List payload;

  /// Конструктор
  ModbusFrame(this.functionCode, this.payload);
}
