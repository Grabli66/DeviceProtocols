import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/applied_protocols/m4_protocol/requests/m4_request.dart';

/// Запрос поиска архивной записи
class M4FindArchiveRecordRequest extends M4Request {
  /// Код функции
  static const FunctionId = 0x61;

  /// Конструктор
  M4FindArchiveRecordRequest() : super(FunctionId);

  /// Преобразует пакет в байты
  @override
  BinaryData toBytes() {
    return null;
  }
}
