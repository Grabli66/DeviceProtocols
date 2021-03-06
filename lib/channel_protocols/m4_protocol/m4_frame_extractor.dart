import 'dart:typed_data';

import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/channel_protocols/m4_protocol/m4_frame.dart';
import 'package:device_protocols/channel_protocols/m4_protocol/m4_long_frame.dart';
import 'package:device_protocols/channel_protocols/m4_protocol/m4_short_frame.dart';
import 'package:device_protocols/common/channel_binary_packet_extractor.dart';

/// Извлекает канальный пакет протокола M4
class M4FrameExtractor extends ChannelBinaryPacketExtractor<M4Frame> {
  /// Конструктор
  M4FrameExtractor(BinaryStreamReader reader) : super(reader);

  /// Читает пакет из потока
  Future<M4Frame> read() async {
    /// Читает пока не найдёт начальный символ
    while (await reader.readUInt8() != M4Frame.StartByte) {}
    
    final network = await reader.readUInt8();    
    final frameType = await reader.readUInt8();
    
    // Разбирает длинный пакет
    if (frameType == M4LongFrame.LongFrameId) {
      final packetId = await reader.readUInt8();
      // Пропускает атрибут
      await reader.readUInt8();
      final len = await reader.readUInt16(Endian.little);
      final body = await reader.readList(len);
      // TODO: проверка CRC
      await reader.readUInt16();

      return M4LongFrame(network, packetId, body);
    } else {
      // Разбирает короткий пакет
      final buffer = BinaryData();
      // Для короткого фрэйма это не тип фрэйма а начальный байт полезных данных
      buffer.writeUInt8(frameType);
      while (true) {
        final bt = await reader.readUInt8();
        if (bt == M4ShortFrame.EndByte) {
          break;
        }
        buffer.writeUInt8(bt);
      }      

      // TODO: проверять контрольную сумму
      return M4ShortFrame(network, buffer.getSlice(0, buffer.length - 1));
    }
  }
}
