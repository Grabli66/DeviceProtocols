import 'package:device_protocols/applied_protocols/usd204_protocol/usd204_command_type.dart';
import 'package:device_protocols/applied_protocols/usd204_protocol/usd204_request.dart';

/// Запрос серийного номера, места установки и названия объекта
class USD204SerialRequest extends USD204Request {
  /// Конструктор
  USD204SerialRequest() : super(USD204CommandType.SerialCommand);  
}