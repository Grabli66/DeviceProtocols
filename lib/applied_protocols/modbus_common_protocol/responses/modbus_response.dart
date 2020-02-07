import 'package:device_protocols/applied_protocols/modbus_common_protocol/modbus_applied_protocol.dart';
import 'package:device_protocols/common/modbus/modbus_function_code.dart';

/// Базовый ответ протокола Modbus
abstract class ModbusResponse extends ModbusAppliedPacket {
  /// Конструктор
  ModbusResponse(ModbusFunctionCode functionCode) : super(functionCode);
}
