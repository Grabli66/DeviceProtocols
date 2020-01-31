import 'dart:typed_data';

import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/applied_protocols/rtu327_protocol/responses/response.dart';

/// Ответ на запрос времени
class GetTimeResponse extends Response {
  /// Дата и время устройства
  final DateTime dateTime;

  /// Конструктор
  GetTimeResponse(this.dateTime);

  /// Создаёт ответ из байт
  factory GetTimeResponse.fromBytes(Uint8List data) {
    final dateTime = BinaryData.fromList(data).readUnixStampSeconds();
    return GetTimeResponse(dateTime);
  }

  /// Конвертирует в байты
  @override
  BinaryData toBytes() {
    final res = super.toBytes();
    final epochSeconds = dateTime.millisecondsSinceEpoch / 1000;
    res.writeUInt32(epochSeconds.round());
    return res;
  }
}
