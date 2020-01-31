import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/applied_protocols/m4_protocol/data_tags/m4_data_tag.dart';
import 'package:device_protocols/applied_protocols/m4_protocol/requests/m4_session_request.dart';
import 'package:device_protocols/applied_protocols/m4_protocol/responses/m4_response.dart';

/// Ответ на запрос чтения параметров
class M4ParameterReadResponse extends M4Response {
  /// Тэги с данными
  final List<M4DataTag> tags;

  /// Конструктор
  M4ParameterReadResponse(this.tags) : super(M4SessionRequest.FunctionId);

  /// Преобразует пакет в байты
  @override
  BinaryData toBytes() {
    final binary = super.toBytes();
    for (var tag in tags) {
      binary.writeBinaryData(tag.toBytes());
    }

    return binary;
  }
}
