import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/channel_protocols/modbus_protocol/modbus_channel_protocol.dart';
import 'package:device_protocols/common/raw_binary_packet.dart';

/// Извлекает данные функции ReadHoldingRegisters
class ModbusRtuReadHoldingRegistersExtractor
    extends ModbusRtuRequestFunctionDataExtractor {
  /// Создаёт извлекателя
  static ModbusRtuFunctionDataExtractor modbusRtuRequestFunctionDataExtractor(
      BinaryStreamReader stream) {
    return ModbusRtuReadHoldingRegistersExtractor(stream);
  }

  /// Конструктор
  ModbusRtuReadHoldingRegistersExtractor(BinaryStreamReader reader)
      : super(reader);

  /// Извлекает пакет
  @override
  Future<RawBinaryPacket> read() {
    // TODO: implement read
    throw UnimplementedError();
  }
}
