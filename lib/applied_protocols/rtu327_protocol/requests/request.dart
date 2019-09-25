import 'package:binary_data/binary_data_lib.dart';

/// Базовый класс запроса
abstract class Request {
  /// Идентификатор комманды
  final int commandId;

  /// Конструктор
  const Request(this.commandId);

  /// Конвертирует в байты
  BinaryData toBytes() {
    var res = BinaryData();
    res.writeUInt8(commandId);
    return res;
  }
}
