import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/common/binary_packet_extractor.dart';
import 'package:device_protocols/transport_protocols/iec1107_protocol/ident_request.dart';

/// Извлекает запросы из бинарных данных
class PacketExtractor extends BinaryPacketExtractor {
  /// Конструктор
  PacketExtractor(BinaryStreamReader reader) : super(reader);

  /// Извлекает пакет идентификации
  Future<IdentRequest> readIdentRequest() async {
    return null;
  }
}
