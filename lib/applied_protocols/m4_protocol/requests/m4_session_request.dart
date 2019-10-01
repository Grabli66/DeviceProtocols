import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/applied_protocols/m4_protocol/requests/m4_request.dart';

/// Запрос установки сеанса
class M4SessionRequest extends M4Request {
  /// Код функции
  static const FunctionId = 0x3F;

  /// Конструктор
  M4SessionRequest() : super(FunctionId);

  /// Преобразует пакет в байты
  @override
  BinaryData toBytes() {
    final binary = super.toBytes();
    binary.writeList([0, 0, 0, 0]);
    return binary;
  }
}
