import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/applied_protocols/elster/rtu327_protocol/rtu327_packet.dart';

/// Базовый класс запроса
abstract class RTU327Request extends RTU327Packet {
  /// Идентификатор комманды
  final int commandId;

  /// Конструктор
  RTU327Request(this.commandId);

  /// Конвертирует в байты
  @override
  BinaryData toBytes() {
    var res = BinaryData();
    res.writeUInt8(commandId);
    return res;
  }
}
