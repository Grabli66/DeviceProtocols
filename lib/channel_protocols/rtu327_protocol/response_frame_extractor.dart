import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/channel_protocols/rtu327_protocol/crc_helper.dart';
import 'package:device_protocols/channel_protocols/rtu327_protocol/response_frame.dart';
import 'package:device_protocols/channel_protocols/rtu327_protocol/rtu327_frame.dart';
import 'package:device_protocols/common/channel_binary_packet_extractor.dart';
import 'package:device_protocols/common/exceptions.dart';

/// Извлекает ResponseFrame из массива байт
class ResponseFrameExtractor extends ChannelBinaryPacketExtractor<ResponseFrame> {
  /// Конструктор
  ResponseFrameExtractor(BinaryStreamReader reader) : super(reader);

  /// Читает фрэйм с ответом
  Future<ResponseFrame> read() async {
    /// Читает пока не найдёт начальный символ
    while (await reader.readUInt8() != Rtu327Frame.START_BYTE) {}

    // Длина только данных фрейма
    final len = await reader.readUInt16() - ResponseFrame.LengthWithoutData;
    final frameId = await reader.readUInt8();
    // Пропускает резерв
    await reader.readUInt32();
    await reader.readUInt16();
    final code = await reader.readUInt8();
    final data = await reader.readList(len);
    final packCrc = await reader.readUInt16();

    // Сравнивает CRC
    final crcPack = BinaryData();
    crcPack.writeUInt8(frameId);
    crcPack.writeUInt32(0);
    crcPack.writeUInt16(0);
    crcPack.writeUInt8(code);
    crcPack.writeList(data);
    final calcCrc = CrcHelper.calculateRTU327CRC(crcPack);
    if (packCrc != calcCrc) {
      throw WrongCrcException();
    }

    return ResponseFrame(frameId, code, BinaryData.fromList(data));
  }
}
