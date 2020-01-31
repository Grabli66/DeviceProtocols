import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/iec1107_packet.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/iec1107_special_bytes.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/iec1107_speed.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/iec1107_work_mode.dart';

/// Запрос режима работы: скорость, чтение/программирование
class IEC1107ModeRequest extends IEC1107Packet {
  /// Скорость работы
  final IEC1107Speed speed;
  
  /// Режим работы
  final IEC1107WorkMode mode;

  /// Конструктор
  IEC1107ModeRequest(this.speed, this.mode);

  /// Возвращает бинарные данные пакета
  @override
  BinaryData toBytes() {
    final binary = BinaryData();
    binary.writeUInt8(IEC1107SpecialBytes.ACK);
    
    
    binary.writeCRLF();
    return binary;
  }
}