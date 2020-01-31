import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/channel_protocols/tpp_protocol/myrmidon_frame.dart';
import 'package:device_protocols/common/channel_binary_packet_extractor.dart';

/// Извлекает ResponseFrame из массива байт
class ResponseFrameExtractor extends ChannelBinaryPacketExtractor<MyrmidonFrame> {
  /// Конструктор
  ResponseFrameExtractor(BinaryStreamReader reader) : super(reader);

  /// Читает из потока байт пакет
  @override
  Future<MyrmidonFrame> read() async {
    // Читает пока не найдёт начальный символ
    while (await reader.readUInt8() != MyrmidonFrame.StartByte) {}

    // Адрес целевого модуля
    final moduleAddress = await reader.readUInt8();

    // Команда всегда 0xAB (SINK_COMMAND_MYRMIDON)
    final sinkCommand = await reader.readUInt8();

    // Длина пакета
    final len = await reader.readUInt8();

    // Прикладные данные
    final data = await reader.readList(len);

    return MyrmidonFrame(moduleAddress, sinkCommand, data);
  }  
}