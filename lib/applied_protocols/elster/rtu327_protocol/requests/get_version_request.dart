import 'package:device_protocols/applied_protocols/elster/rtu327_protocol/requests/rtu327_request.dart';

/// Запрос версии
class GetVersionRequest extends RTU327Request {
  /// Код комманды
  static const int COMMAND_ID = 3;

  /// Конструктор
  GetVersionRequest() : super(COMMAND_ID);
}
