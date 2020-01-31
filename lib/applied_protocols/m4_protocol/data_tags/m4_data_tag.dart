import 'package:binary_data/binary_data.dart';

/// Тэг с данными относящийся к прикладному пакету
abstract class M4DataTag {
  /// Идентификатор тэга
  final int tagId;

  /// Конструктор
  M4DataTag(this.tagId);

  /// Преобразует в байты
  BinaryData toBytes() {
    final binary = BinaryData();
    binary.writeUInt8(tagId);
    return binary;
  }
}
