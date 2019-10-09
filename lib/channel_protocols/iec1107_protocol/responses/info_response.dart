import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/crc_helper.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/iec1107_packet.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/special_bytes.dart';

/// Ответ на информационных запрос
class InfoResponse extends IEC1107Packet {
  /// Данные с информацией
  final String data;

  /// true - пакет частичный, false - полный
  final bool isPartial;

  /// true - ответ на запрос программирования, false - другой ответ
  final bool isProgramm;

  /// Конструктор
  InfoResponse(this.data, {this.isProgramm = true, this.isPartial = false});

  /// Возвращает бинарные данные пакета
  @override
  BinaryData toBytes() {
    final binary = BinaryData();
    binary.writeUInt8(SpecialBytes.STX);
    binary.writeString(data);
    if (isProgramm) {
      if (isPartial) {
        binary.writeUInt8(SpecialBytes.EOT);
      } else {
        binary.writeUInt8(SpecialBytes.ETX);
      }
    } else {
      binary.writeString("!");
      binary.writeCRLF();
      binary.writeUInt8(SpecialBytes.ETX);      
    }
    final crc = CrcHelper.calcBcc(binary);
    binary.writeUInt8(crc);

    return binary;
  }
}
