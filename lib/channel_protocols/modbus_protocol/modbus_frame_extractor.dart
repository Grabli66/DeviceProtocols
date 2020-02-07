import 'package:binary_data/src/binary_stream_reader.dart';
import 'package:device_protocols/channel_protocols/modbus_protocol/modbus_channel_protocol.dart';
import 'package:device_protocols/common/channel_binary_packet_extractor.dart';

/// Извлекает канальный пакет протокола M4
class ModbusFrameExtractor
    extends ChannelBinaryPacketExtractor<ModbusRtuFrame> {

  /// Конструктор
  ModbusFrameExtractor(BinaryStreamReader reader) : super(reader);

  /// Читает пакет из потока
  Future<ModbusRtuFrame> read() async {
    
  }
}
