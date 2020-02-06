import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/applied_protocols/elster/rtu325_protocol/rtu325_packet.dart';
import 'package:device_protocols/common/rtu325/rtu325_response_code.dart';

/// Базовый прикладной запрос протокола RTU325
abstract class RTU325Response extends RTU325Packet {
  /// Код ответа
  final RTU325ResponseCode responseCode;

  /// Конструктор
  RTU325Response(this.responseCode);

  /// Преобразует в байты
  @override
  BinaryData toBytes() {
    var binary = BinaryData();
    binary.writeUInt8(responseCode.code);
    return binary;
  }
}
