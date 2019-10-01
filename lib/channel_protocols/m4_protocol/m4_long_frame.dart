import 'dart:typed_data';

import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/channel_protocols/m4_protocol/m4_crc_helper.dart';
import 'package:device_protocols/channel_protocols/m4_protocol/m4_frame.dart';

/// Длинный канальный пакет протокола M4
class M4LongFrame extends M4Frame {
  /// Атрибут сообщения. Всегда 0
  static const Attribute = 0;

  /// Идентификатор длинного сообщения
  static const LongFrameId = 0x90;

  /// Идентификатор пакета
  final int packetId;

  /// Конструктор
  M4LongFrame(int networkAddress, this.packetId, Uint8List body)
      : super(networkAddress, body);

  /// Преобразует пакет в байты
  @override
  BinaryData toBytes() {
    final res = super.toBytes();
    res.writeUInt8(LongFrameId);
    res.writeUInt8(packetId);
    res.writeUInt8(Attribute);
    res.writeUInt16(body.length, Endian.little);
    res.writeList(body);
    final crc = M4CrcHelper.calcCrc(res, 1, res.length - 1);
    res.writeUInt16(crc);
    return res;
  }
}
