import 'package:device_protocols/channel_protocols/rtu325_protocol/rtu325_frame.dart';

/// Канальный пакет запроса
class RTU325RequestFrame extends RTU325Frame {
  /// Конструктор
  RTU325RequestFrame(int packetId, int address,
      {bool compressed, bool encrypted})
      : super(packetId, address, compressed: compressed, encrypted: encrypted);
}
