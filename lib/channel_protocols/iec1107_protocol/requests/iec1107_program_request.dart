import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/crc_helper.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/iec1107_command_type.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/iec1107_packet.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/iec1107_special_bytes.dart';

/// Запрос программирования
class IEC1107ProgramRequest extends IEC1107Packet {
  /// Команда
  final IEC1107CommandType command;

  /// Передаваемые данные
  final String data;

  /// true - пакет частичный, false - полный
  final bool isPartial;

  /// Конструктор
  IEC1107ProgramRequest(this.command, this.data, {this.isPartial = false});

  /// Возвращает бинарные данные пакета
  @override
  BinaryData toBytes() {
    final binary = BinaryData();
    binary.writeUInt8(IEC1107SpecialBytes.SOH);
    binary.writeString(command.toString());
    binary.writeUInt8(IEC1107SpecialBytes.STX);
    binary.writeString(data);
    if (isPartial) {
      binary.writeUInt8(IEC1107SpecialBytes.EOT);
    } else {
      binary.writeUInt8(IEC1107SpecialBytes.ETX);
    }
    final crc = CrcHelper.calcBcc(binary);
    binary.writeUInt8(crc);
    return binary;
  }
}
