import 'dart:typed_data';

import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/applied_protocols/rtu327_protocol/responses/response.dart';

/// Ответ на запрос версии
class GetVersionResponse extends Response {
  /// Старший номер версии
  final int version1;

  /// Средний номер версии
  final int version2;

  /// Младший номер версии
  final int version3;

  /// Конструктор
  GetVersionResponse(this.version1, this.version2, this.version3);

  /// Создаёт ответ из байт
  factory GetVersionResponse.fromBytes(Uint8List data) {
    return GetVersionResponse(data[0], data[1], data[2]);
  }

  /// Конвертирует в байты
  @override
  BinaryData toBytes() {
    final res = super.toBytes();
    res.writeUInt8(version1);
    res.writeUInt8(version2);
    res.writeUInt8(version3);
    return res;
  }
}
