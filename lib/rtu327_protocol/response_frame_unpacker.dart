import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/common/exceptions.dart';
import 'package:device_protocols/rtu327_protocol/crc_helper.dart';
import 'package:device_protocols/rtu327_protocol/frame.dart';
import 'package:device_protocols/rtu327_protocol/response_frame.dart';

/// Извлекает ResponseFrame из массива байт
class ResponseFrameUnpacker {
  /// Буффер для данных
  final BinaryStreamReader _reader;

  /// Конструктор
  ResponseFrameUnpacker(this._reader);

  /// Читает фрэйм с ответом
  Future<ResponseFrame> read() async {
    /// Читает пока не найдёт начальный символ
    while (await _reader.readUInt8() != Frame.START_BYTE) {}

    // Длина только данных фрейма
    final len = await _reader.readUInt16() - ResponseFrame.LengthWithoutData;
    final frameId = await _reader.readUInt8();
    // Пропускает резерв
    await _reader.readUInt32();
    await _reader.readUInt16();
    final code = await _reader.readUInt8();
    final data = await _reader.readList(len);
    final packCrc = await _reader.readUInt16();

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
