import 'dart:typed_data';

import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/channel_protocols/rtu325_protocol/rtu325_frame.dart';
import 'package:device_protocols/common/rtu325/rtu325_response_code.dart';

/// Канальный пакет ответа
class RTU325ResponseFrame extends RTU325Frame {
  /// Код ответа
  final RTU325ResponseCode responseCode;

  /// Данные пакета
  final Uint8List data;

  /// Конструктор
  RTU325ResponseFrame(int packetId, int address, this.responseCode, this.data,
      {bool compressed, bool encrypted})
      : super(packetId, address, compressed: compressed, encrypted: encrypted);

  /// Возвращает данные запроса
  @override
  BinaryData getPayload() {
    final binary = BinaryData();
    binary.writeUInt8(responseCode.code);
    binary.writeList(data);
    return binary;
  }
}
