import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/channel_protocols/rtu327_protocol/rtu327_crc_helper.dart';
import 'package:device_protocols/channel_protocols/rtu327_protocol/rtu327_frame.dart';
import 'package:device_protocols/channel_protocols/rtu327_protocol/rtu327_password.dart';

class RequestFrame extends Rtu327Frame {
  /// Пароль RTU сервера STR<4>
  final Rtu327Password password;

  /// Запрос
  final BinaryData request;

  /// Конструктор
  RequestFrame(int frameId, this.password, this.request) : super(frameId);

  /// Конвертирует в байты
  BinaryData toBytes() {
    final res = super.toBytes();
    final reqBytes = request;
    // Длина запроса(команда + запрос) + порядковый номер + пароль + резерв
    final len = reqBytes.length + 2 + 4 + 2;
    res.writeUInt16(len);

    final crcPacket = BinaryData();

    crcPacket.writeUInt8(frameId);
    crcPacket.writeList(password.toBytes());

    // Резерв
    crcPacket.writeUInt8(0);
    crcPacket.writeUInt8(0);
    // Код команды + команда
    crcPacket.writeBinaryData(reqBytes);
    // Считает и добавляет CRC
    var crc = Rtu327CrcHelper.calculateRTU327CRC(crcPacket);
    res.writeBinaryData(crcPacket);
    res.writeInt16(crc);

    return res;
  }
}
