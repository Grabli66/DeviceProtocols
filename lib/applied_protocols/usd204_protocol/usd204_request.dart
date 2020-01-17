import 'package:device_protocols/applied_protocols/usd204_protocol/usd204_command_type.dart';
import 'package:device_protocols/applied_protocols/usd204_protocol/usd204_packet.dart';

/// Базовый запрос USD204
abstract class USD204Request extends USD204Packet {
  /// Конструктор
  USD204Request(USD204CommandType commandType) : super(commandType);
}
