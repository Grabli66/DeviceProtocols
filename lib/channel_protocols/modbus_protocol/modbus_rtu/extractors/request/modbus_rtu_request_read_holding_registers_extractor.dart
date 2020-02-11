import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/channel_protocols/modbus_protocol/modbus_channel_protocol.dart';
import 'package:device_protocols/common/raw_binary_packet.dart';

/// Извлекает данные запроса для функции ReadHoldingRegisters
class ModbusRtuRequestReadHoldingRegistersExtractor
    extends ModbusRtuRequestFunctionDataExtractor {
  /// Создаёт извлекателя
  static ModbusRtuFunctionDataExtractor create(
      BinaryStreamReader stream) {
    return ModbusRtuRequestReadHoldingRegistersExtractor(stream);
  }

  /// Конструктор
  ModbusRtuRequestReadHoldingRegistersExtractor(BinaryStreamReader reader)
      : super(reader);

  /// Извлекает пакет
  @override
  Future<RawBinaryPacket> read() async {
    final binary = BinaryData();
    // Начальный регистр
    final startReg = await reader.readUInt16();
    binary.writeUInt16(startReg);
    // Количество регистров для чтения
    final count = await reader.readUInt16();
    binary.writeUInt16(count);
    return RawBinaryPacket(binary);
  }
}
