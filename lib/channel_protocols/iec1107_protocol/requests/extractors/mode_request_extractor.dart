import 'dart:convert';

import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/iec1107_special_bytes.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/iec1107_speed.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/iec1107_work_mode.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/requests/iec1107_mode_request.dart';
import 'package:device_protocols/common/channel_binary_packet_extractor.dart';
import 'package:device_protocols/common/exceptions.dart';

/// Извлекает запросы установки параметров обмена
class ModeRequestExtractor
    extends ChannelBinaryPacketExtractor<IEC1107ModeRequest> {
  /// Конструктор
  ModeRequestExtractor(BinaryStreamReader reader) : super(reader);

  /// Извлекает пакет идентификации
  @override
  Future<IEC1107ModeRequest> read() async {
    final ack = await reader.readUInt8();
    if (ack != IEC1107SpecialBytes.ACK) {
      throw WrongPacketFormatException();
    }

    final line = utf8.decode(await reader.readLine());
    if (line.length < 3) {
      throw WrongPacketFormatException();
    }

    final speedStr = line[1];
    final modeStr = line[2];

    final speed = IEC1107Speed.fromString(speedStr);
    final mode = IEC1107WorkMode.fromString(modeStr);
    if (mode == null || speed == null) {
      throw WrongPacketFormatException();
    }

    return IEC1107ModeRequest(speed, mode);
  }
}
