import 'dart:typed_data';

import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/common/binary_packet.dart';

/// Базовый канальный пакет протокола M4
abstract class M4Frame extends BinaryPacket {
  // Начальный байт
  static const int StartByte = 0x10;

  /// Сетевой номер
  final int networkAddress;

  /// Тело сообщения
  final Uint8List body;

  /// Конструктор
  M4Frame(this.networkAddress, this.body);

  /// Преобразует пакет в байты
  @override
  BinaryData toBytes() {
    final res = BinaryData();
    res.writeUInt8(StartByte);
    res.writeUInt8(networkAddress);
    return res;
  }
}
