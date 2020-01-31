import 'dart:typed_data';

import 'package:device_protocols/channel_protocols/rtu325_protocol/rtu325_frame.dart';
import 'package:device_protocols/common/rtu325/rtu325_command_code.dart';

/// Канальный пакет запроса
class RTU325RequestFrame extends RTU325Frame {
  /// Код команды
  final RTU325CommandCode commandCode;

  /// Данные пакета
  final Uint8List data;

  /// Конструктор
  RTU325RequestFrame(int packetId, int address, this.commandCode, this.data,
      {bool compressed, bool encrypted})
      : super(packetId, address, compressed: compressed, encrypted: encrypted);
}
