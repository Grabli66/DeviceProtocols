import 'package:device_protocols/common/binary_packet.dart';
import 'package:device_protocols/common/channel_binary_packet_extractor.dart';
import 'package:meta/meta.dart';

/// Извлекатель канальных бинарных пакетов
abstract class AppliedBinaryPacketExtractor<TPacket extends BinaryPacket> {  
  /// Читает бинарные данные
  @protected
  final ChannelBinaryPacketExtractor<BinaryPacket> channelExtractor;

  /// Конструктор
  AppliedBinaryPacketExtractor(this.channelExtractor);

  /// Читает из извлекателя канальных пакетов массив прикладных данных и извлекает из них прикладной пакет
  Future<TPacket> read();
}
