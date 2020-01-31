import 'dart:typed_data';

import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/applied_protocols/rtu327_protocol/requests/request.dart';

/// Запрос коррекции времени
class SetTimeRequest extends Request {
  /// Код комманды
  static const int COMMAND_ID = 115;

  /// Дельта на которую нужно скорректировать время
  final int delta;

  /// Конструктор
  SetTimeRequest(this.delta) : super(COMMAND_ID);

  /// Создаёт ответ из байт
  factory SetTimeRequest.fromBytes(Uint8List data) {
    return SetTimeRequest(BinaryData.fromList(data).readInt32());
  }

  /// Конвертирует в байты
  @override
  BinaryData toBytes() {
    var res = BinaryData();
    res.writeInt32(delta);
    return res;
  }
}
