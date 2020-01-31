import 'dart:typed_data';

import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/applied_protocols/rtu327_protocol/responses/response.dart';

/// Информация о событии
class EventInfo {
  /// Идентификатор события
  final int id;

  /// Код события
  final int code;

  /// Тип устройства
  final int deviceType;

  /// Время события
  final DateTime dateTime;

  /// Параметры события
  final Uint8List eventData;

  /// Конструктор
  EventInfo(this.id, this.code, this.deviceType, this.dateTime, this.eventData);
}

/// Ответ на запрос журнала событий
class GetLogResponse extends Response {
  /// Максимальный идентификатор события запрашиваемой секции.
  final List<EventInfo> events;

  /// Конструктор
  GetLogResponse(this.events);

  /// Создаёт ответ из байт
  factory GetLogResponse.fromBytes(Uint8List data) {
    final binary = BinaryData.fromList(data);
    final events = <EventInfo>[];
    while (!binary.isEnd) {
      final id = binary.readUInt32();
      final code = binary.readUInt16();
      final dev = binary.readUInt8();
      final time = binary.readUnixStampSeconds();
      final len = binary.readUInt16();
      final paramData = binary.readList(len);

      events.add(EventInfo(id, code, dev, time, paramData));
    }

    return GetLogResponse(events);
  }

  /// Конвертирует в байты
  @override
  BinaryData toBytes() {
    final res = super.toBytes();
    for (var event in events) {
      res.writeUInt32(event.id);
      res.writeUInt16(event.code);
      res.writeUInt8(event.deviceType);
      res.writeUnixStampSeconds(event.dateTime);
      res.writeUInt16(event.eventData.length);
      res.writeList(event.eventData);
    }

    return res;
  }
}
