import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/applied_protocols/usd204_protocol/usd204_command_type.dart';
import 'package:device_protocols/common/binary_packet.dart';

/// Базовый пакет USD204
abstract class USD204Packet extends BinaryPacket {
  /// Тип команды в запросе или ответе
  final USD204CommandType commandType;

  /// Конструктор
  USD204Packet(this.commandType);

  /// Преобразует в байты
  @override
  BinaryData toBytes() {
    final binary = BinaryData();
    binary.writeUInt16(commandType.command);
    return binary;
  }  
}
