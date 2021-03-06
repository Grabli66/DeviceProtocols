import 'package:device_protocols/applied_protocols/modbus_common_protocol/modbus_applied_protocol.dart';
import 'package:device_protocols/common/modbus/modbus_function_code.dart';

/// Базовый запрос протокола Modbus
abstract class ModbusRequest extends ModbusAppliedPacket {
  /// Конструктор
  ModbusRequest(ModbusFunctionCode functionCode) : super(functionCode);  
}
