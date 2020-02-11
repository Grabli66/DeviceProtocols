import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/channel_protocols/modbus_protocol/modbus_channel_protocol.dart';
import 'package:device_protocols/common/raw_binary_packet.dart';

/// Извлекает данные ответа для функции ReadHoldingRegisters
class ModbusRtuResponseReadHoldingRegistersExtractor
    extends ModbusRtuRequestFunctionDataExtractor {
  /// Создаёт извлекателя
  static ModbusRtuFunctionDataExtractor create(
      BinaryStreamReader stream) {
    return ModbusRtuResponseReadHoldingRegistersExtractor(stream);
  }

  /// Конструктор
  ModbusRtuResponseReadHoldingRegistersExtractor(BinaryStreamReader reader)
      : super(reader);

  /// Извлекает пакет
  @override
  Future<RawBinaryPacket> read() async {
    final binary = BinaryData();
    // Длина блока данных
    final len = await reader.readUInt8();
    binary.writeUInt8(len);
    final data = await reader.readList(len);
    binary.writeList(data);
    return RawBinaryPacket(binary);
  }
}
