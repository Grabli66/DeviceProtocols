import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/common/binary_packet.dart';
import 'package:device_protocols/common/modbus/modbus_function_code.dart';

/// Базовый пакет Modbus
abstract class ModbusAppliedPacket extends BinaryPacket {
  /// Код функции Modbus
  final ModbusFunctionCode functionCode;

  /// Конструктор
  ModbusAppliedPacket(this.functionCode);

  /// Возвращает полезную нагрузку пакета
  BinaryData getPayload();

  /// Преобразует в байты
  @override
  BinaryData toBytes() {
    var binary = BinaryData();
    binary.writeUInt8(functionCode.code);
    final payload = getPayload();
    binary.writeBinaryData(payload);
    return binary;
  }
}
