import 'package:device_protocols/applied_protocols/m4_protocol/m4_packet.dart';

/// Прикладной запрос в протоколе M4
abstract class M4Request extends M4Packet {
  /// Конструктор
  M4Request(int functionId) : super(functionId);  
}
