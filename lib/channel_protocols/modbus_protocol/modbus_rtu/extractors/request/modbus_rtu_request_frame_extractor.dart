import 'package:binary_data/binary_data.dart';
import 'package:binary_data/src/binary_stream_reader.dart';
import 'package:device_protocols/channel_protocols/modbus_protocol/modbus_channel_protocol.dart';

import 'package:device_protocols/common/modbus/modbus_function_code.dart';

/// Извлекает канальный запрос протокола Modbus RTU
class ModbusRtuRequestFrameExtractor extends ModbusRtuFrameExtractor {
  /// Конструктор
  ModbusRtuRequestFrameExtractor(BinaryStreamReader reader) : super(reader) {
    registerRequestDataExtractor(ModbusFunctionCode.ReadHoldingRegisters.code,
        ModbusRtuRequestReadHoldingRegistersExtractor.create);
  }
}
