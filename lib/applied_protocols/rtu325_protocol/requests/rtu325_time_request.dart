import 'dart:typed_data';

import 'package:device_protocols/applied_protocols/rtu325_protocol/requests/rtu325_reqeust.dart';
import 'package:device_protocols/common/rtu325/rtu325_command_code.dart';

/// Запрос времени RTU325
class Rtu325TimeRequest extends RTU325Request {
  /// Код команды
  static const Command = RTU325CommandCode.GetRtuTimeCommand;

  /// Конструктор
  Rtu325TimeRequest() : super(Command);

  /// Создаёт из бинарного пакета
  static Rtu325TimeRequest fromBinary(Uint8List data) {
    // Запрос не содержит данных
    return Rtu325TimeRequest();
  }
}
