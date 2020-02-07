import 'package:binary_data/binary_data.dart';
import 'package:binary_data/src/binary_data.dart';
import 'package:device_protocols/applied_protocols/modbus_common_protocol/requests/modbus_request.dart';
import 'package:device_protocols/common/modbus/modbus_function_code.dart';

/// Запрос чтение значений из нескольких регистров хранения (Read Holding Registers)
class ReadHoldingRegistersRequest extends ModbusRequest {
  /// Адрес начального регистра
  final int startRegister;

  /// Количество регистров для чтения
  final int count;

  /// Конструктор
  ReadHoldingRegistersRequest(this.startRegister, this.count)
      : super(ModbusFunctionCode.ReadHoldingRegisters);

  /// Возвращает полезную нагрузку пакета
  @override
  BinaryData getPayload() {
    final binary = BinaryData();
    binary.writeUInt16(startRegister);
    binary.writeUInt16(count);
    return binary;
  }
}
