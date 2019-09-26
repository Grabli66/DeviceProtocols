import 'dart:typed_data';

import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/applied_protocols/rtu327_protocol/meter_number.dart';
import 'package:device_protocols/applied_protocols/rtu327_protocol/requests/request.dart';

/// Запрос параметров счетчика, GETSHPRM
class GetMeterSettingsRequest extends Request {
  /// Код комманды
  static const int COMMAND_ID = 112;

  /// Номер счётчика
  final MeterNumber meterNumber;

  /// Конструктор
  GetMeterSettingsRequest(this.meterNumber) : super(COMMAND_ID);

  /// Создаёт ответ из байт
  factory GetMeterSettingsRequest.fromBytes(Uint8List data) {
    final number = MeterNumber.fromBytes(data);
    return GetMeterSettingsRequest(number);
  }

  /// Конвертирует в байты
  @override
  BinaryData toBytes() {
    var res = BinaryData();
    res.writeList(meterNumber.toBytes());
    return res;
  }
}
