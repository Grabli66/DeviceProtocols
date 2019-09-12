import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/rtu327_protocol/crc_helper.dart';
import 'package:device_protocols/rtu327_protocol/frame.dart';
import 'package:device_protocols/rtu327_protocol/requests/request.dart';
import 'package:device_protocols/rtu327_protocol/rtu327_password.dart';

class RequestFrame extends Frame {
  /// Пароль RTU сервера STR<4>
  final Rtu327Password password;

  /// Запрос
  final Request request;

  /// Конструктор
  const RequestFrame(int frameId, this.password, this.request) : super(frameId);

  /// Конвертирует в байты
  BinaryData toBytes() {
    final res = super.toBytes();
    final reqBytes = request.toBytes();
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
    var crc = CrcHelper.calculateRTU327CRC(crcPacket);
    res.writeBinaryData(crcPacket);
    res.writeInt16(crc);

    return res;
  }
}
