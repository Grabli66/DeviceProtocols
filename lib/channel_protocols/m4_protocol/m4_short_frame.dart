import 'dart:typed_data';

import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/channel_protocols/m4_protocol/m4_crc_helper.dart';
import 'package:device_protocols/channel_protocols/m4_protocol/m4_frame.dart';

/// Короткий канальный пакет протокола M4
class M4ShortFrame extends M4Frame {
  /// Конечный байт сообщения
  static const EndByte = 0x16;

  /// Конструктор
  M4ShortFrame(int networkAddress, Uint8List body)
      : super(networkAddress, body);

  /// Преобразует пакет в байты
  @override
  BinaryData toBytes() {
    final res = super.toBytes();
    res.writeList(body);
    final cs = M4CrcHelper.calcControlSumm(res, 1, res.length);
    res.writeUInt8(cs);
    res.writeUInt8(EndByte);
    return res;
  }
}
