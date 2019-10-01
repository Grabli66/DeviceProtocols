import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/applied_protocols/m4_protocol/requests/m4_request.dart';

/// Запрос чтения параметра
class M4ParameterReadRequest extends M4Request {
  /// Код функции
  static const FunctionId = 0x72;

  /// Конструктор
  M4ParameterReadRequest() : super(FunctionId);

  /// Преобразует пакет в байты
  @override
  BinaryData toBytes() {
    return null;
  }
}
