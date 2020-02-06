import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/common/binary_packet.dart';
import 'package:device_protocols/common/modbus/modbus_function_code.dart';

/// Базовый запрос протокола Modbus
abstract class ModbusRequest extends BinaryPacket {
  /// Код функции Modbus
  final ModbusFunctionCode functionCode;
  
  /// Конструктор
  ModbusRequest(this.functionCode);  

  /// Преобразует в байты
  @override
  BinaryData toBytes() {
    var binary = BinaryData();
    binary.writeUInt8(functionCode.code);
    return binary;
  }
}
