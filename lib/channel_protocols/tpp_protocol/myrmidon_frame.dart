import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/channel_protocols/tpp_protocol/tpp_crc_helper.dart';
import 'package:device_protocols/common/binary_packet.dart';

/// Канальный пакет для передачи прикладных данных протокола Myrmidon
class MyrmidonFrame extends BinaryPacket {
  /// Начальный байт
  static const StartByte = 0xAA;

  /// Адрес целевого модуля всегда
  final int moduleAddress;

  /// Команда - признак протокола
  final int sinkCommand;

  /// Прикладные данные
  final List<int> data;

  /// Конструктор
  MyrmidonFrame(this.moduleAddress, this.sinkCommand, this.data);

  /// Преобразует в байты
  @override
  BinaryData toBytes() {
    final binary = BinaryData();
    binary.writeUInt8(StartByte);
    binary.writeUInt8(moduleAddress);
    binary.writeUInt8(sinkCommand);
    binary.writeList(data);
    final crc = TppCrcHelper.calcCrc(binary, 1, binary.length - 1);
    binary.writeUInt16(crc);
    return binary;
  }

  /// Считает CRC пакета
  int calcCrc() {
    final binary = BinaryData();
    binary.writeUInt8(moduleAddress);
    binary.writeUInt8(sinkCommand);
    binary.writeList(data);
    return TppCrcHelper.calcCrc(binary, 0, binary.length);
  }
}
