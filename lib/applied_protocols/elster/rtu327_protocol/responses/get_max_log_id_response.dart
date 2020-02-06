import 'dart:typed_data';

import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/applied_protocols/elster/rtu327_protocol/responses/rtu327_response.dart';

/// Ответ на запрос максимального номера события журнала событий
class GetMaxLogIdResponse extends RTU327Response {
  /// Максимальный идентификатор события запрашиваемой секции.
  final int maxId;

  /// Конструктор
  GetMaxLogIdResponse(this.maxId);

  /// Создаёт ответ из байт
  factory GetMaxLogIdResponse.fromBytes(Uint8List data) {
    final maxId = BinaryData.fromList(data).readUInt32();
    return GetMaxLogIdResponse(maxId);
  }

  /// Конвертирует в байты
  @override
  BinaryData toBytes() {
    final res = super.toBytes();
    res.writeUInt32(maxId);
    return res;
  }
}
