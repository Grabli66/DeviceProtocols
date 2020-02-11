import 'package:binary_data/binary_data.dart';
import 'package:binary_data/src/binary_stream_reader.dart';
import 'package:device_protocols/channel_protocols/modbus_protocol/modbus_channel_protocol.dart';
import 'package:device_protocols/common/channel_binary_packet_extractor.dart';
import 'package:device_protocols/common/modbus/modbus_function_code.dart';
import 'package:meta/meta.dart';

/// Извлекает канальный ответ протокола Modbus RTU
abstract class ModbusRtuFrameExtractor
    extends ChannelBinaryPacketExtractor<ModbusRtuFrame> {
  /// Извлекатели данных для функций
  @protected
  final Map<int, ModbusRtuFunctionDataExtractorCreatorFunc>
      functionDataExtractors = {};

  /// Конструктор
  ModbusRtuFrameExtractor(BinaryStreamReader reader) : super(reader);

  /// Регистрирует пользовательского извлекателя для конкретной функции
  void registerRequestDataExtractor(
      int code, ModbusRtuFunctionDataExtractorCreatorFunc creatorFunc) {
    functionDataExtractors[code] = creatorFunc;
  }

  /// Читает пакет из потока
  Future<ModbusRtuFrame> read() async {
    final network = await reader.readUInt8();
    final func = await reader.readUInt8();
    int packetCrc = 0;
    BinaryData binary;

    // Находит конкретного извлекателя данных для функции
    final dataExtractor = functionDataExtractors[func]?.call(reader);
    if (dataExtractor != null) {
      final funcData = await dataExtractor.read();
      binary = funcData.toBytes();
      packetCrc = await reader.readUInt8();
    } else {
      // Или читает по таймауту
      binary = BinaryData();
      try {
        while (true) {
          var b = await reader.readUInt8().timeout(Duration(milliseconds: 100));
          binary.writeUInt8(b);
        }
      } catch (TimeoutException) {
        final lastIndex = binary.length - 1;
        // Получает CRC
        packetCrc = binary.getUInt16(lastIndex);
        // Отрезает CRC копированием без него
        binary = BinaryData.fromList(binary.getSlice(0, lastIndex - 2));
      }
    }

    // Проверяет CRC

    return ModbusRtuFrame(network, ModbusFunctionCode(func), binary.getList());
  }
}
