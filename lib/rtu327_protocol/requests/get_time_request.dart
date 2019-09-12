import 'package:device_protocols/rtu327_protocol/requests/request.dart';

/// Запрос времени УСПД
class GetTimeRequest extends Request {
  /// Код комманды
  static const int COMMAND_ID = 114;

  /// Конструктор
  const GetTimeRequest() : super(COMMAND_ID);
}
