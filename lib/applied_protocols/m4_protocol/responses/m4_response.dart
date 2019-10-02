import 'package:device_protocols/applied_protocols/m4_protocol/m4_packet.dart';

/// Ответ в протоколе M4
abstract class M4Response extends M4Packet {
  /// Конструктор
  M4Response(int functionId) : super(functionId);
}
