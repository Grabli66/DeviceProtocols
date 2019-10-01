import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/programm_request.dart';
import 'package:device_protocols/common/channel_binary_packet_extractor.dart';

/// Извлекает запросы программирования из бинарных данных
class ProgrammRequestExtractor extends ChannelBinaryPacketExtractor<ProgrammRequest> {
  /// Конструктор
  ProgrammRequestExtractor(BinaryStreamReader reader) : super(reader);

  /// Извлекает пакет идентификации
  Future<ProgrammRequest> read() async {
    return null;
  }
}
