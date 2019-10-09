import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/common/binary_packet.dart';

/// Ответ подтверждения
class ConfirmResponse extends BinaryPacket {
  /// Тип подтверждения
  final int confirmType;

  /// Конструктор
  ConfirmResponse(this.confirmType);
  
  /// Возвращает бинарные данные пакета
  @override
  BinaryData toBytes() {
    final binary = BinaryData();

    return binary;
  }
}
