import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/applied_protocols/m4_protocol/requests/m4_session_request.dart';
import 'package:device_protocols/applied_protocols/m4_protocol/responses/m4_response.dart';

/// Ответ на запрос сессии
class M4SessionResponse extends M4Response {
  /// Код устройства
  final int deviceCode;

  /// Модификатор исполнения
  final int modelId;

  /// Конструктор
  M4SessionResponse([this.deviceCode = 0, this.modelId = 0])
      : super(M4SessionRequest.FunctionId);

  /// Преобразует пакет в байты
  @override
  BinaryData toBytes() {
    final binary = super.toBytes();
    binary.writeUInt16(deviceCode);
    binary.writeUInt8(modelId);
    return binary;
  }
}
