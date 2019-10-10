import 'dart:convert';

import 'package:device_protocols/channel_protocols/iec1107_protocol/handlers/iec1107_channel_protocol_handler.dart';
import 'package:device_protocols/common/binary_transport_channel.dart';
import 'package:device_protocols/common/exceptions.dart';

/// Обработчик канальных пакетов протокола IEC1107 на серверной стороне
class IEC1107ServerChannelProtocolHandler
    extends IEC1107ChannelProtocolHandler {
  /// Длина поля производитель
  static const ManufacturerLength = 3;

  /// Максимальный размер поля модели устройства
  static const MaxModelLength = 10;

  /// Возможные скорости
  static const PossibleSpeed = <String>{
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I"
  };

  /// Конструктор
  IEC1107ServerChannelProtocolHandler(BinaryTransportChannel transportChannel)
      : super(transportChannel);

  /// Читает пакет установки сессии и возвращает сетевой номер
  Future<String> readStartSession() async {
    return null;
  }

  /// Читает режим работы: скорость, чтение/программирование
  Future<String> readMode() async {
    return null;
  }

  /// Читает запрос режима программирования
  Future<String> readProgrammRequest() async {
    return null;
  }

  /// Отправляет пакет идентификации: производитель, скорость работы, модель устройства
  void sendIdent(String manufacturer, String speed, String model) {
    if (manufacturer.length != ManufacturerLength) {
      throw WrongArgumentException("Manufacturer field must be 3 chars");
    }

    if (!PossibleSpeed.contains(speed)) {
      throw WrongArgumentException("Unsupported speed");
    }

    if (model.length > MaxModelLength) {
      throw WrongArgumentException("Model must be less than ${MaxModelLength}");
    }

    transportChannel.sendList(utf8.encode("/$manufacturer$speed$model"));
  }

  /// Отправляет ключ пароля с помощью команды P0
  void sendPasswordKey(String key) {}
}
