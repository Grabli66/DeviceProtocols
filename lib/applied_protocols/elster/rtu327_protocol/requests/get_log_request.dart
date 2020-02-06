import 'dart:typed_data';

import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/applied_protocols/elster/rtu327_protocol/requests/rtu327_request.dart';

/// Запрос журнала событий
class GetLogRequest extends RTU327Request {
  /// Код комманды
  static const int COMMAND_ID = 117;

  /// Номер секции журнала событий. Номер секции должен быть 1 (секция основных событий УСПД)
  final int sectionId;

  /// Идентификатор(номер) 1 -го запрашиваемого события (>Id).
  final int eventId;

  /// Максимальное кол-во запрашиваемых событий
  final int count;

  /// Конструктор
  GetLogRequest(this.sectionId, this.eventId, this.count) : super(COMMAND_ID);

  /// Создаёт ответ из байт
  factory GetLogRequest.fromBytes(Uint8List data) {
    final binary = BinaryData.fromList(data);
    final sectionId = binary.readUInt32();
    final eventId = binary.readUInt32();
    final count = binary.readUInt8();
    return GetLogRequest(sectionId, eventId, count);
  }

  /// Конвертирует в байты
  @override
  BinaryData toBytes() {
    var res = BinaryData();
    res.writeUInt32(sectionId);
    res.writeUInt32(eventId);
    res.writeUInt32(count);
    return res;
  }
}
