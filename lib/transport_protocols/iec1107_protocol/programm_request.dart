import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/common/binary_packet.dart';
import 'package:device_protocols/transport_protocols/iec1107_protocol/crc_helper.dart';
import 'package:device_protocols/transport_protocols/iec1107_protocol/special_bytes.dart';

/// Запрос программирования
class ProgrammRequest extends BinaryPacket {
  /// Команда
  final String command;

  /// Передаваемые данные
  final String data;

  /// true - пакет частичный, false - полный
  final bool isPartial;

  /// Конструктор
  ProgrammRequest(this.command, this.data, {this.isPartial = false});

  /// Возвращает бинарные данные пакета
  @override
  BinaryData toBytes() {
    final binary = BinaryData();
    binary.writeUInt8(SpecialBytes.SOH);
    binary.writeString(command);
    binary.writeUInt8(SpecialBytes.STX);
    binary.writeString(data);
    if (isPartial) {
      binary.writeUInt8(SpecialBytes.EOT);
    } else {
      binary.writeUInt8(SpecialBytes.ETX);
    }
    final crc = CrcHelper.calcBcc(binary);
    binary.writeUInt8(crc);
    return binary;
  }
}
