import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/applied_protocols/modbus_common_protocol/modbus_applied_protocol.dart';
import 'package:device_protocols/common/modbus/modbus_function_code.dart';

/// Базовый ответ протокола Modbus
class ReadHoldingRegistersResponse extends ModbusAppliedPacket {
  /// Данные пакета
  final BinaryData payload;

  /// Конструктор
  ReadHoldingRegistersResponse(this.payload)
      : super(ModbusFunctionCode.ReadHoldingRegisters);

  /// Возвращает полезную нагрузку пакета
  @override
  BinaryData getPayload() {    
    final binary = BinaryData();
    binary.writeInt8(payload.length);
    binary.writeBinaryData(payload);
    return binary;
  }
}
