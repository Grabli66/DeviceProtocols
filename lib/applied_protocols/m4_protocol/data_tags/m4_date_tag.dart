import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/applied_protocols/m4_protocol/data_tags/m4_data_tag.dart';

/// Тэг с датой
class M4DateTag extends M4DataTag {
  /// Код тэга
  static const TagId = 0x48;

  /// Значение
  final DateTime value;

  /// Конструктор
  M4DateTag(this.value) : super(TagId);

  /// Преобразует в байты
  @override
  BinaryData toBytes() {
    final binary = super.toBytes();
    binary.writeUInt8(4);
    binary.writeUInt8(value.day);
    binary.writeUInt8(value.month);
    binary.writeUInt8(value.year - 2000);
    binary.writeUInt8(value.weekday);
    return binary;
  }
}
