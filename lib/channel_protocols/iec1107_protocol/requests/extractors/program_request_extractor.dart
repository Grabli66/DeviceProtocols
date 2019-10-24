import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/requests/iec1107_program_request.dart';
import 'package:device_protocols/common/channel_binary_packet_extractor.dart';

/// Извлекает запросы программирования из бинарных данных
class ProgrammRequestExtractor extends ChannelBinaryPacketExtractor<IEC1107ProgramRequest> {
  /// Конструктор
  ProgrammRequestExtractor(BinaryStreamReader reader) : super(reader);

  /// Извлекает пакет идентификации
  Future<IEC1107ProgramRequest> read() async {
    return null;
  }
}
