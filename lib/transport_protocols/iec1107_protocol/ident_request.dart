import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/common/binary_packet.dart';

/// Запрос идентификации
class IdentRequest extends BinaryPacket {
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
