import 'package:device_protocols/applied_protocols/elster/rtu327_protocol/requests/rtu327_request.dart';

/// Запрос времени
class GetTimeRequest extends RTU327Request {
  /// Код комманды
  static const int COMMAND_ID = 114;

  /// Конструктор
  GetTimeRequest() : super(COMMAND_ID);
}
