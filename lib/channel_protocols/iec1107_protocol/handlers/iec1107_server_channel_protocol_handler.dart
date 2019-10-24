import 'dart:convert';

import 'package:device_protocols/channel_protocols/iec1107_protocol/handlers/iec1107_channel_protocol_handler.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/iec1107_command_type.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/iec1107_speed.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/requests/extractors/mode_request_extractor.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/requests/extractors/program_request_extractor.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/requests/extractors/start_session_request_extractor.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/requests/iec1107_mode_request.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/requests/iec1107_program_request.dart';
import 'package:device_protocols/common/binary_transport_channel.dart';
import 'package:device_protocols/common/exceptions.dart';

/// Обработчик канальных пакетов протокола IEC1107 на серверной стороне
class IEC1107ServerChannelProtocolHandler
    extends IEC1107ChannelProtocolHandler {
  /// Ключ пароля, фиктивный, для того что бы соблюсти протокол
  static const PasswordKey = "1234567";

  /// Длина поля производитель
  static const ManufacturerLength = 3;

  /// Максимальный размер поля модели устройства
  static const MaxModelLength = 10;

  /// Конструктор
  IEC1107ServerChannelProtocolHandler(BinaryTransportChannel transportChannel)
      : super(transportChannel);

  /// Отправляет пакет в режиме программирования
  void sendProgramPacket(IEC1107CommandType command, String data,
      [bool isPartial = false]) async {
    transportChannel.sendList(
        IEC1107ProgramRequest(command, data, isPartial: isPartial)
            .toBytes()
            .getList());
  }

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
  Future<IEC1107ProgramRequest> readProgrammRequest() async {
    return await ProgrammRequestExtractor(transportChannel.streamReader).read();
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
  void sendPasswordKey(String key) {
    sendProgramPacket(IEC1107CommandType.P0, PasswordKey);
  }
}
