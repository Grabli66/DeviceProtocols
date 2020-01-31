import 'dart:typed_data';

import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/applied_protocols/rtu327_protocol/requests/request.dart';

/// Запрос получения максимального номера события журнала событий
class GetMaxLogIdRequest extends Request {
  /// Код комманды
  static const int COMMAND_ID = 101;

  /// Номер секции журнала событий. Номер секции должен быть 1 (секция основных событий УСПД)
  final int sectionId;

  /// Конструктор
  GetMaxLogIdRequest(this.sectionId) : super(COMMAND_ID);

  /// Создаёт ответ из байт
  factory GetMaxLogIdRequest.fromBytes(Uint8List data) {
    return GetMaxLogIdRequest(data[0]);
  }

  /// Конвертирует в байты
  @override
  BinaryData toBytes() {
    var res = BinaryData();
    res.writeUInt8(sectionId);
    return res;
  }
}
