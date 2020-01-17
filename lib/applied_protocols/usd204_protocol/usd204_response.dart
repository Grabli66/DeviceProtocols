import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/applied_protocols/usd204_protocol/usd204_command_type.dart';
import 'package:device_protocols/applied_protocols/usd204_protocol/usd204_packet.dart';
import 'package:device_protocols/applied_protocols/usd204_protocol/usd204_response_code.dart';

/// Базовый ответ USD204
abstract class USD204Response extends USD204Packet {
  /// Код ответа
  final USD204ResponseCode code;

  /// Конструктор
  USD204Response(USD204CommandType commandType, this.code) : super(commandType);

  /// Преобразует в байты
  @override
  BinaryData toBytes() {
    final binary = super.toBytes();
    binary.writeUInt8(code.code);
    return binary;
  }
}
