import 'package:device_protocols/applied_protocols/rtu325_protocol/requests/rtu325_reqeust.dart';
import 'package:device_protocols/channel_protocols/rtu325_protocol/rtu325_request_frame.dart';
import 'package:device_protocols/common/applied_binary_packet_extractor.dart';
import 'package:device_protocols/common/binary_packet.dart';
import 'package:device_protocols/common/channel_binary_packet_extractor.dart';
import 'package:device_protocols/common/rtu325/rtu325_command_code.dart';

/// Извлекает прикладные запросы
class M4RequestExtractor
    extends AppliedBinaryPacketExtractor<RTU325Request> {
  /// Конструктор
  M4RequestExtractor(
      ChannelBinaryPacketExtractor<BinaryPacket> channelExtractor)
      : super(channelExtractor) {

      }

  /// Читает из потока байт пакет
  @override
  Future<RTU325Request> read() async {
    final packet = (await channelExtractor.read()) as RTU325RequestFrame;
    
  }
}
