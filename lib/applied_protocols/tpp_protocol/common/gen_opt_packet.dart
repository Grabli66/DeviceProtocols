import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/applied_protocols/tpp_protocol/common/device_ui.dart';
import 'package:device_protocols/applied_protocols/tpp_protocol/common/gen_opt_status.dart';
import 'package:device_protocols/applied_protocols/tpp_protocol/common/general_option.dart';
import 'package:device_protocols/applied_protocols/tpp_protocol/common/option_command.dart';
import 'package:device_protocols/applied_protocols/tpp_protocol/common/option_command_attribute.dart';
import 'package:device_protocols/common/binary_packet.dart';

/// Пакет обобщённой опции
abstract class GenOptPacket extends BinaryPacket {
  /// Идентификатор обслуживающего модуля
  final DeviceEui eui;

  /// Идентификатор обобщённой опции
  final GeneralOption option;

  /// Статус пакета
  final GenOptStatus status;

  /// Атрибут комманды опции
  final OptionCommandAttribute optionCommandAttribute;

  /// Команда опции
  final OptionCommand commandOption;

  /// Конструктор
  GenOptPacket(this.eui, this.option, this.status, this.optionCommandAttribute,
      this.commandOption);

  /// Преобразует пакет в байты
  @override
  BinaryData toBytes() {
    final result = BinaryData();
    result.writeList(eui.toBytes());
    result.writeUInt16(option.value);
    result.writeUInt8(status.value);
    result.writeUInt8(optionCommandAttribute.value);
    result.writeUInt8(commandOption.value);
    return result;
  }
}
