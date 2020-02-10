import 'package:binary_data/binary_data.dart';
import 'package:binary_data/src/binary_stream_reader.dart';
import 'package:device_protocols/channel_protocols/modbus_protocol/modbus_channel_protocol.dart';
import 'package:device_protocols/common/channel_binary_packet_extractor.dart';
import 'package:device_protocols/common/modbus/modbus_function_code.dart';

/// Извлекает канальный запрос протокола Modbus RTU
class ModbusRtuRequestFrameExtractor
    extends ChannelBinaryPacketExtractor<ModbusRtuRequestFrame> {
  /// Извлекатели данных для функций
  final Map<ModbusFunctionCode, Object> _functionDataExtractors = {};

  /// Конструктор
  ModbusRtuRequestFrameExtractor(BinaryStreamReader reader) : super(reader);

  /// Регистрирует извлекателя для конкретной функции
  void registerRequestDataExtractor(ModbusFunctionCode code) {}

  /// Читает пакет из потока
  Future<ModbusRtuRequestFrame> read() async {
    final network = await reader.readUInt8();
    final func = await reader.readUInt8();
    // Находит конкретного извлекателя данных для функции
    // Или читает по таймауту
    final binary = BinaryData();
    try {
      while (true) {
        var b = await reader.readUInt8().timeout(Duration(milliseconds: 100));
        binary.writeUInt8(b);
      }
    } catch (TimeoutException) {
      //
    }

    // Проверяет CRC
  }
}
