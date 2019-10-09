import 'package:device_protocols/applied_protocols/ek270_protocol/handlers/ek270_single_value_data.dart';
import 'package:device_protocols/common/applied_protocol_handler.dart';

/// Читает единичное значение
class ReadValueHandler extends AppliedProtocolHandler<EK270SingleValueData> {
  /// Запускает исполнение
  @override
  Future<EK270SingleValueData> start() {
    return null;
  }
}
