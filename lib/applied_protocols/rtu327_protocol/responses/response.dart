import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/applied_protocols/rtu327_protocol/rtu327_packet.dart';

/// Ответ
abstract class Response extends Rtu327Packet {
  /// Конвертирует в байты
  @override
  BinaryData toBytes() {
    final res = BinaryData();
    return res;
  }
}
