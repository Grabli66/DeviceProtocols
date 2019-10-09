import 'package:device_protocols/common/binary_transport_channel.dart';

/// Обработчик пакетов канального уровня
abstract class ChannelProtocolHandler {
  /// Канал для приёма/отправки дбинарных данных
  final BinaryTransportChannel transportChannel;

  /// Конструктор
  ChannelProtocolHandler(this.transportChannel);
}