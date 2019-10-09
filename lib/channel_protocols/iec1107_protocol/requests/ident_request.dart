import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/iec1107_packet.dart';

/// Запрос идентификации
class IdentRequest extends IEC1107Packet {
  /// Адрес устройства
  final String address;

  /// Конструктор
  IdentRequest(this.address);

  /// Возвращает бинарные данные пакета
  @override
  BinaryData toBytes() {
    final binary = BinaryData();
    binary.writeString("/?$address!");
    binary.writeCRLF();
    return binary;
  }
}
