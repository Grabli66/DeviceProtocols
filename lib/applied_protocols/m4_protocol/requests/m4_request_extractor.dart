import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/applied_protocols/m4_protocol/requests/m4_request.dart';
import 'package:device_protocols/applied_protocols/m4_protocol/requests/m4_session_request.dart';
import 'package:device_protocols/channel_protocols/m4_protocol/m4_frame.dart';
import 'package:device_protocols/common/applied_binary_packet_extractor.dart';
import 'package:device_protocols/common/binary_packet.dart';
import 'package:device_protocols/common/channel_binary_packet_extractor.dart';
import 'package:device_protocols/common/exceptions.dart';

/// Извлекает прикладные запросы
class M4RequestExtractor extends AppliedBinaryPacketExtractor<M4Request> {
  /// Конструктор
  M4RequestExtractor(
      ChannelBinaryPacketExtractor<BinaryPacket> channelExtractor)
      : super(channelExtractor);

  /// Читает из потока байт пакет
  @override
  Future<M4Request> read() async {
    final packet = (await channelExtractor.read()) as M4Frame;
    final binary = BinaryData.fromList(packet.body);
    final func = binary.readUInt8();

    switch (func) {
      case M4SessionRequest.FunctionId:
        binary.readList(4);
        return M4SessionRequest();
    }

    throw UnsupportedPacketException();
  }
}
