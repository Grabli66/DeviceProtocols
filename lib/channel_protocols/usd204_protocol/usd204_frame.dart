import 'dart:typed_data';

import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/channel_protocols/usd204_protocol/usd204_frame_type.dart';
import 'package:device_protocols/common/binary_packet.dart';

/// Базовый канальный пакет
abstract class Usd204Frame extends BinaryPacket {
  /// Начальные байты пакета
  static const StartBytes = [0x7E, 0x7E, 0x7E, 0x7E, 0x7E, 0x7E, 0x7E, 0x7E];

  /// Тип фрейма
  final Usd204FrameType type;

  /// Длинна отстафингованной части передаваемых данных
  int get length => data.length;

  /// Номер части передаваемых данных (начинается с 1)
  final int number;

  /// Общее количество частей
  final int count;

  /// Данные фрейма
  final Uint8List data;

  /// Конструктор
  Usd204Frame(this.type, this.number, this.count, [this.data]);

  /// Преобразует пакет в байты
  @override
  BinaryData toBytes() {
    final res = BinaryData();
    res.writeList(StartBytes);
    res.writeUInt8(type.value);
    res.writeUInt16(length);
    res.writeUInt16(number);
    res.writeUInt16(count);
    // CRC

    if (data != null) {
      res.writeList(data);
    }

    return res;
  }
}
