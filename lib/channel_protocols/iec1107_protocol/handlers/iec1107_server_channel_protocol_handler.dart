import 'dart:convert';

import 'package:device_protocols/channel_protocols/iec1107_protocol/handlers/iec1107_channel_protocol_handler.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/iec1107_speed.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/requests/extractors/mode_request_extractor.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/requests/extractors/start_session_request_extractor.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/requests/iec1107_mode_request.dart';
import 'package:device_protocols/common/binary_transport_channel.dart';
import 'package:device_protocols/common/exceptions.dart';

/// Обработчик канальных пакетов протокола IEC1107 на серверной стороне
class IEC1107ServerChannelProtocolHandler
    extends IEC1107ChannelProtocolHandler {
  /// Длина поля производитель
  static const ManufacturerLength = 3;

  /// Максимальный размер поля модели устройства
  static const MaxModelLength = 10;

  /// Конструктор
  IEC1107ServerChannelProtocolHandler(BinaryTransportChannel transportChannel)
      : super(transportChannel);

  /// Читает пакет установки сессии и возвращает сетевой номер
  Future<String> readStartSession() async {
    final request =
        await StartSessionRequestExtractor(transportChannel.streamReader)
            .read();
    return request.address;
  }

  /// Читает режим работы: скорость, чтение/программирование
  Future<IEC1107ModeRequest> readMode() async {
    return await ModeRequestExtractor(transportChannel.streamReader).read();
  }

  /// Читает запрос режима программирования
  Future<String> readProgrammRequest() async {
    return null;
  }

  /// Отправляет пакет: производитель, скорость работы, модель устройства
  void sendIdent(String manufacturer, IEC1107Speed speed, String model) {
    if (manufacturer.length != ManufacturerLength) {
      throw WrongArgumentException("Manufacturer field must be 3 chars");
    }

    if (model.length > MaxModelLength) {
      throw WrongArgumentException("Model must be less than ${MaxModelLength}");
    }

    transportChannel.sendList(utf8.encode("/$manufacturer$speed$model"));
  }

  /// Отправляет ключ пароля с помощью команды P0
  void sendPasswordKey(String key) {}
}
