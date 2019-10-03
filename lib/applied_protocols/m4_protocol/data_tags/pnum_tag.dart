import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/applied_protocols/m4_protocol/data_tags/m4_data_tag.dart';

/// Передаёт параметр состоящий из номера канала и номера регистра
class PnumTag extends M4DataTag {
  /// Код тэга
  static const TagId = 0x4A;

  /// Номер канала
  final int channelId;

  /// Код параметра
  final int parameter;

  /// Конструктор
  PnumTag(this.channelId, this.parameter) : super(TagId);

  /// Преобразует в байты
  @override
  BinaryData toBytes() {
    final binary = super.toBytes();
    binary.writeUInt8(channelId);
    binary.writeUInt16(parameter);
    return binary;
  }

  @override
  String toString() {
    return "PnumTag. Channel: ${channelId} Parameter: ${parameter}";
  }
}
