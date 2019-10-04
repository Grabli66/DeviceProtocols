import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/applied_protocols/m4_protocol/data_tags/pnum_tag.dart';
import 'package:device_protocols/applied_protocols/m4_protocol/requests/m4_request.dart';

/// Запрос чтения параметров
class M4ParameterReadRequest extends M4Request {
  /// Код функции
  static const FunctionId = 0x72;

  /// Список запросов параметров
  final List<PnumTag> parameterList;

  /// Конструктор
  M4ParameterReadRequest(this.parameterList) : super(FunctionId);

  /// Преобразует пакет в байты
  @override
  BinaryData toBytes() {
    final binary = super.toBytes();
    for (var param in parameterList) {
      binary.writeBinaryData(param.toBytes());
    }
    return binary;
  }
}
