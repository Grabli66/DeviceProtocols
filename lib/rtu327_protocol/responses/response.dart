import 'package:binary_data/binary_data_lib.dart';

/// Ответ
abstract class Response {
  /// Конвертирует в байты
  BinaryData toBytes() {
    final res = BinaryData();
    return res;
  }
}
