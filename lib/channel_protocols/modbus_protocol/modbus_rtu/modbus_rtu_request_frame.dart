import 'dart:typed_data';

import 'package:device_protocols/channel_protocols/modbus_protocol/modbus_channel_protocol.dart';
import 'package:device_protocols/common/modbus/modbus_function_code.dart';

/// Пакет запроса в протоколе Modbus RTU
class ModbusRtuRequestFrame extends ModbusRtuFrame {
  /// Конструктор
  ModbusRtuRequestFrame(
      int networkAddress, ModbusFunctionCode functionCode, Uint8List payload)
      : super(networkAddress, functionCode, payload);
}
