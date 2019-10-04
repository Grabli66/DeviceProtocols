import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/applied_protocols/m4_protocol/data_tags/m4_data_tag.dart';

/// Тэг с временем
class M4TimeTag extends M4DataTag {
  /// Код тэга
  static const TagId = 0x47;

  /// Значение
  final DateTime value;

  /// Конструктор
  M4TimeTag(this.value) : super(TagId);

  /// Преобразует в байты
  @override
  BinaryData toBytes() {
    final binary = super.toBytes();
    binary.writeUInt8(4);
    binary.writeUInt8(0); // Тики
    binary.writeUInt8(value.second);
    binary.writeUInt8(value.minute);
    binary.writeUInt8(value.hour);
    return binary;
  }
}
