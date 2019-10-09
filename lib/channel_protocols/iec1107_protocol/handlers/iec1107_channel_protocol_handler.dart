import 'package:device_protocols/common/binary_transport_channel.dart';
import 'package:device_protocols/common/channel_protocol_handler.dart';

/// Базовый обработчик пакетов протокола IEC1107
abstract class IEC1107ChannelProtocolHandler extends ChannelProtocolHandler {
  /// Конструктор
  IEC1107ChannelProtocolHandler(BinaryTransportChannel transportChannel) : super(transportChannel);
}