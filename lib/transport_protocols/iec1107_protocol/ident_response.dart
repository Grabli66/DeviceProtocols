import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/common/binary_packet.dart';

/// Ответ на идентификацию
class IdentResponse extends BinaryPacket {
  /// Три символа, информация об изготовителе
  final String manufacturer;

  /// Скорость, один символ
  final String speed;

  /// Идентификатор, не более 16 символов
  final String ident;

  /// Конструктор
  IdentResponse(this.manufacturer, this.speed, this.ident);

  /// Возвращает бинарные данные пакета
  @override
  BinaryData toBytes() {
    final binary = BinaryData();
    binary.writeString("/?$manufacturer$speed$ident");
    binary.writeCRLF();
    return binary;
  }
}
