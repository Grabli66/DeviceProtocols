import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/applied_protocols/m4_protocol/requests/m4_request.dart';

/// Запрос изменения скорости обмена
class M4SpeedChangeRequest extends M4Request {
  /// Код функции
  static const FunctionId = 0x42;

  /// Конструктор
  M4SpeedChangeRequest() : super(FunctionId);

  /// Преобразует пакет в байты
  @override
  BinaryData toBytes() {
    return null;
  }
}
