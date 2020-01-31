import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/applied_protocols/ek270_protocol/ek270_packet.dart';

/// Запрос чтения архивных значений
class EK270ReadArchiveRequest extends EK270Packet {
  /// Преобразует в байты
  @override
  BinaryData toBytes() {
    return null;
  }
}