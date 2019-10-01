import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/common/binary_packet.dart';

/// Извлекатель канальных бинарных пакетов
abstract class ChannelBinaryPacketExtractor<TPacket extends BinaryPacket> {
  /// Читает бинарные данные
  final BinaryStreamReader reader;

  /// Конструктор
  ChannelBinaryPacketExtractor(this.reader);

  /// Создаёт из другого извлекателя пакетов
  /// TODO: доделать
  ChannelBinaryPacketExtractor.fromBinaryExtractor(
      ChannelBinaryPacketExtractor extractor)
      : reader = null;

  /// Читает из потока байт пакет
  Future<TPacket> read();
}
