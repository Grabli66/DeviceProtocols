import 'dart:typed_data';

import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/applied_protocols/m4_protocol/data_tags/pnum_tag.dart';
import 'package:device_protocols/applied_protocols/m4_protocol/requests/extractors/m4_request_extracted_data.dart';
import 'package:device_protocols/applied_protocols/m4_protocol/requests/m4_parameter_read_request.dart';
import 'package:device_protocols/applied_protocols/m4_protocol/requests/m4_session_request.dart';
import 'package:device_protocols/channel_protocols/m4_protocol/m4_frame.dart';
import 'package:device_protocols/common/applied_binary_packet_extractor.dart';
import 'package:device_protocols/common/binary_packet.dart';
import 'package:device_protocols/common/channel_binary_packet_extractor.dart';
import 'package:device_protocols/common/exceptions.dart';

/// Извлекает прикладные запросы
class M4RequestExtractor
    extends AppliedBinaryPacketExtractor<M4RequestExtractedData> {
  /// Читает список параметров PNUM
  Iterable<PnumTag> _readPnumList(BinaryData binary) sync* {
    while (!binary.isEnd) {
      final tag = binary.readUInt8();
      if (tag != PnumTag.TagId) {
        throw WrongPacketFormatException();
      }

      // Пропускает длину
      binary.readUInt8();

      final channel = binary.readUInt8();
      final param = binary.readUInt16(Endian.little);

      yield PnumTag(channel, param);
    }
  }

  /// Конструктор
  M4RequestExtractor(
      ChannelBinaryPacketExtractor<BinaryPacket> channelExtractor)
      : super(channelExtractor);

  /// Читает из потока байт пакет
  @override
  Future<M4RequestExtractedData> read() async {
    final packet = (await channelExtractor.read()) as M4Frame;
    final binary = BinaryData.fromList(packet.body);
    final func = binary.readUInt8();

    switch (func) {
      case M4SessionRequest.FunctionId:
        binary.readList(4);
        return M4RequestExtractedData(packet, M4SessionRequest());
      case M4ParameterReadRequest.FunctionId:
        final pnumList = _readPnumList(binary).toList();
        return M4RequestExtractedData(packet, M4ParameterReadRequest(pnumList));
    }

    throw UnsupportedPacketException("Unknown function ${func}");
  }
}
