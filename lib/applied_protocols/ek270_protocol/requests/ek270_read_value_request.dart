import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/applied_protocols/ek270_protocol/ek270_packet.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/iec1107_command_type.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/requests/iec1107_program_request.dart';

/// Запрос чтения единичного значения
class EK270ReadValueRequest extends EK270Packet {
  /// Адрес значения
  final String address;

  /// Преобразует в байты
  EK270ReadValueRequest(this.address);

  @override
  BinaryData toBytes() {
    final req = "$address(1)";
    return IEC1107ProgramRequest(IEC1107CommandType.R1, req).toBytes();
  }
}
