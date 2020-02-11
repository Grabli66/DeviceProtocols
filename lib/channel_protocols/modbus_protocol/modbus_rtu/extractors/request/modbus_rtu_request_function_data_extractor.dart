import 'package:binary_data/src/binary_stream_reader.dart';
import 'package:device_protocols/channel_protocols/modbus_protocol/modbus_channel_protocol.dart';

/// Базовый Извлекатель данных по коду функции
abstract class ModbusRtuRequestFunctionDataExtractor
    extends ModbusRtuFunctionDataExtractor {
  /// Конструктор
  ModbusRtuRequestFunctionDataExtractor(BinaryStreamReader reader)
      : super(reader);
}
