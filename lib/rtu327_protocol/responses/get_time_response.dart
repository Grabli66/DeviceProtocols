import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/rtu327_protocol/responses/response.dart';

/// Ответ на запрос времени
class GetTimeResponse extends Response {
  /// Дата и время устройства
  final DateTime dateTime;

  /// Конструктор
  GetTimeResponse(this.dateTime);

  /// Создаёт ответ из байт
  factory GetTimeResponse.fromBytes(BinaryData binary) {
    return GetTimeResponse(DateTime.now());
  }

  /// Конвертирует в байты
  @override
  BinaryData toBytes() {
    final res = super.toBytes();
    final epochSeconds = dateTime.millisecondsSinceEpoch / 1000;
    res.writeUInt32(epochSeconds.round());
    return res;
  }  
}