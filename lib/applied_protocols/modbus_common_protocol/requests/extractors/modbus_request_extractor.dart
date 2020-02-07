import 'package:device_protocols/applied_protocols/modbus_common_protocol/modbus_applied_protocol.dart';
import 'package:device_protocols/channel_protocols/modbus_protocol/modbus_channel_protocol.dart';
import 'package:device_protocols/common/applied_binary_packet_extractor.dart';
import 'package:device_protocols/common/binary_packet.dart';
import 'package:device_protocols/common/channel_binary_packet_extractor.dart';

/// Извлекает прикладные запросы
class ModbusRequestExtractor
    extends AppliedBinaryPacketExtractor<ModbusRequest> {
  /// Конструктор
  ModbusRequestExtractor(
      ChannelBinaryPacketExtractor<BinaryPacket> channelExtractor)
      : super(channelExtractor);

  // Читает из потока байт пакет
  @override
  Future<ModbusRequest> read() async {
    final packet = (await channelExtractor.read()) as ModbusFrame;
  }
}
