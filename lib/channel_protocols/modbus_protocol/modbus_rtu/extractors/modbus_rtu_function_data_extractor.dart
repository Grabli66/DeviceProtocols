import 'package:binary_data/src/binary_stream_reader.dart';
import 'package:device_protocols/common/channel_binary_packet_extractor.dart';
import 'package:device_protocols/common/raw_binary_packet.dart';

/// Базовый Извлекатель данных по коду функции
abstract class ModbusRtuFunctionDataExtractor
    extends ChannelBinaryPacketExtractor<RawBinaryPacket> {
  /// Конструктор
  ModbusRtuFunctionDataExtractor(BinaryStreamReader reader) : super(reader);
}
