import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/applied_protocols/elster/rtu325_protocol/responses/rtu325_time_response.dart';

import 'package:device_protocols/channel_protocols/rtu325_protocol/rtu325_response_frame.dart';
import 'package:device_protocols/common/applied_binary_packet_extractor.dart';
import 'package:device_protocols/common/binary_packet.dart';
import 'package:device_protocols/common/channel_binary_packet_extractor.dart';

/// Извлекает ответ запроса времени
class RTU325TimeResponseExtractor
    extends AppliedBinaryPacketExtractor<RTU325TimeResponse> {
  /// Конструктор
  RTU325TimeResponseExtractor(
      ChannelBinaryPacketExtractor<BinaryPacket> channelExtractor)
      : super(channelExtractor);

  /// Читает из потока байт пакет
  @override
  Future<RTU325TimeResponse> read() async {
    final packet = (await channelExtractor.read()) as RTU325ResponseFrame;
    final dateTime = packet.data.getUnixTimeSeconds(0);
    return RTU325TimeResponse(packet.responseCode, dateTime);
  }
}
