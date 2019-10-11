import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/iec1107_packet.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/iec1107_speed.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/iec1107_work_mode.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/special_bytes.dart';

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
    binary.writeUInt8(SpecialBytes.ACK);
    
    
    binary.writeCRLF();
    return binary;
  }
}