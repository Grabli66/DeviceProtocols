import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/applied_protocols/m4_protocol/requests/m4_request.dart';

/// Запрос управления счётом
class M4CalculateRequest extends M4Request {
  /// Код функции
  static const FunctionId = 0x4F;

  /// Конструктор
  M4CalculateRequest() : super(FunctionId);

  /// Преобразует пакет в байты
  @override
  BinaryData toBytes() {
    return null;
  }
}
