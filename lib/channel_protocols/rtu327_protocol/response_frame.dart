import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/channel_protocols/rtu327_protocol/crc_helper.dart';
import 'package:device_protocols/channel_protocols/rtu327_protocol/rtu327_frame.dart';

/// Фрэйм ответа
class ResponseFrame extends Rtu327Frame {
  /// Длина фрейма без учёта данных: номер пакета + резерв1 + резерв2 + код ответа
  static const LengthWithoutData = 2 + 4 + 2 + 1;

  /// Код ответа
  final int code;

  /// Тело ответа ответ
  final BinaryData response;

  /// Конструктор
  ResponseFrame(int frameId, this.code, [this.response]) : super(frameId);

  // Преобразует пакет в байты
  @override
  BinaryData toBytes() {
    final res = super.toBytes();
    var len = ResponseFrame.LengthWithoutData;
    BinaryData respBytes;
    if (response != null) {
      respBytes = response;
      // порядковый номер + 6 байт резерв + код результата + длина ответа
      len += respBytes.length;
    }

    res.writeUInt16(len);

    final crcPacket = BinaryData();
    crcPacket.writeUInt8(frameId);
    crcPacket.writeUInt32(0);
    crcPacket.writeUInt16(0);
    crcPacket.writeUInt8(code);

    if (respBytes != null) {
      crcPacket.writeBinaryData(respBytes);
    }

    // Считает и добавляет CRC
    var crc = CrcHelper.calculateRTU327CRC(crcPacket);
    res.writeBinaryData(crcPacket);
    res.writeInt16(crc);

    return res;
  }
}
