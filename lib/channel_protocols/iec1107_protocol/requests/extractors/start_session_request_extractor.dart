import 'dart:convert';

import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/requests/iec1107_ident_request.dart';
import 'package:device_protocols/common/channel_binary_packet_extractor.dart';

/// Извлекает запросы начала сессии
class StartSessionRequestExtractor
    extends ChannelBinaryPacketExtractor<IEC1107IdentRequest> {
  /// Конструктор
  StartSessionRequestExtractor(BinaryStreamReader reader) : super(reader);

  /// Извлекает пакет идентификации
  @override
  Future<IEC1107IdentRequest> read() async {    
    await reader.readUntilChar('/');
    String line = utf8.decode(await reader.readLine());        

    final reg = RegExp(r"\/\?(.*)\!");
    final network = reg.firstMatch(line).group(1);
    return IEC1107IdentRequest(network);
  }
}
