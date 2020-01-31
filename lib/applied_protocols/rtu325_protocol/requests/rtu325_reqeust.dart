import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/applied_protocols/rtu325_protocol/rtu325_packet.dart';
import 'package:device_protocols/common/rtu325/rtu325_command_code.dart';

/// Базовый прикладной запрос протокола RTU325
abstract class RTU325Request extends RTU325Packet {
  /// Код команды RTU325
  final RTU325CommandCode commandCode;

  /// Конструктор
  RTU325Request(this.commandCode);

  /// Преобразует в байты
  @override
  BinaryData toBytes() {
    var binary = BinaryData();
    binary.writeUInt8(commandCode.code);
    return binary;
  }
}
