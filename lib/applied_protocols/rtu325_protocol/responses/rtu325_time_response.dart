import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/applied_protocols/rtu325_protocol/responses/rtu325_response.dart';
import 'package:device_protocols/common/rtu325/rtu325_response_code.dart';

/// Базовый прикладной запрос протокола RTU325
class RTU325TimeResponse extends RTU325Response {
  /// Конструктор
  final DateTime dateTime;

  /// Конструктор
  RTU325TimeResponse(RTU325ResponseCode responseCode, this.dateTime)
      : super(responseCode);

  /// Преобразует в байты
  @override
  BinaryData toBytes() {
    var binary = super.toBytes();
    binary.writeUnixStampSeconds(dateTime);
    return binary;
  }
}
