import 'package:device_protocols/channel_protocols/iec1107_protocol/handlers/iec1107_channel_protocol_handler.dart';
import 'package:device_protocols/common/binary_transport_channel.dart';

/// Обработчик канальных пакетов протокола IEC1107 на серверной стороне
class IEC1107ServerChannelProtocolHandler
    extends IEC1107ChannelProtocolHandler {
  /// Конструктор
  IEC1107ServerChannelProtocolHandler(BinaryTransportChannel transportChannel)
      : super(transportChannel);

  /// Читает пакет установки сессии и возвращает сетевой номер
  Future<String> readStartSession() async {
    return null;
  }
}
