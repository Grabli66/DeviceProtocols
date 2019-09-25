import 'package:device_protocols/applied_protocols/rtu327_protocol/requests/request.dart';

/// Запрос версии
class GetVersionRequest extends Request {
  /// Код комманды
  static const int COMMAND_ID = 3;

  /// Конструктор
  GetVersionRequest() : super(COMMAND_ID);
}
