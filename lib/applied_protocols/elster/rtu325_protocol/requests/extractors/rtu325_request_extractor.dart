import 'dart:typed_data';

import 'package:device_protocols/applied_protocols/elster/rtu325_protocol/requests/rtu325_reqeust.dart';
import 'package:device_protocols/applied_protocols/elster/rtu325_protocol/requests/rtu325_time_request.dart';
import 'package:device_protocols/channel_protocols/rtu325_protocol/rtu325_request_frame.dart';
import 'package:device_protocols/common/applied_binary_packet_extractor.dart';
import 'package:device_protocols/common/binary_packet.dart';
import 'package:device_protocols/common/channel_binary_packet_extractor.dart';
import 'package:device_protocols/common/rtu325/rtu325_command_code.dart';

/// Обработчик бинарного пакета, возвращающего запрос
typedef RTU325Request RTU325RequestHandler(Uint8List binary);

/// Извлекает прикладные запросы
class RTU325RequestExtractor extends AppliedBinaryPacketExtractor<RTU325Request> {
  /// Обработчики запросов в бинарном виде
  static Map<RTU325CommandCode, RTU325RequestHandler> handlers = {};

  /// Конструктор
  RTU325RequestExtractor(
      ChannelBinaryPacketExtractor<BinaryPacket> channelExtractor)
      : super(channelExtractor) {
    handlers[Rtu325TimeRequest.Command] = Rtu325TimeRequest.fromBinary;
  }

  /// Читает из потока байт пакет
  @override
  Future<RTU325Request> read() async {
    final packet = (await channelExtractor.read()) as RTU325RequestFrame;
    final handler = handlers[packet.commandCode];
    if (handler != null) {
      return handler(packet.data);
    }

    //  TODO: кидать исключение
    return null;
  }
}
