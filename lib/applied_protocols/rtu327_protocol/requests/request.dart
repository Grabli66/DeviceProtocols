import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/applied_protocols/rtu327_protocol/rtu327_packet.dart';

/// Базовый класс запроса
abstract class Request extends Rtu327Packet {
  /// Идентификатор комманды
  final int commandId;

  /// Конструктор
  Request(this.commandId);

  /// Конвертирует в байты
  @override
  BinaryData toBytes() {
    var res = BinaryData();
    res.writeUInt8(commandId);
    return res;
  }
}
