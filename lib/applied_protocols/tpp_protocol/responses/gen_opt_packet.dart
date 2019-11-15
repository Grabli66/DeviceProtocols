import 'package:device_protocols/applied_protocols/tpp_protocol/common/device_option.dart';
import 'package:device_protocols/applied_protocols/tpp_protocol/common/device_ui.dart';
import 'package:device_protocols/applied_protocols/tpp_protocol/common/gen_opt_status.dart';
import 'package:device_protocols/applied_protocols/tpp_protocol/common/option_command.dart';
import 'package:device_protocols/applied_protocols/tpp_protocol/common/option_command_attribute.dart';

class GenOptPacket {
  /// Идентификатор обслуживающего модуля
  final DeviceEui eui;

  /// Идентификатор опции
  final DeviceOption option;

  /// Статус пакета
  final GenOptStatus status;

  /// Атрибут комманды опции
  final OptionCommandAttribute optionCommandAttribute;

  /// Команда опции
  final OptionCommand commandOption;

  /// Конструктор
  GenOptPacket(this.eui, this.option, this.status, this.optionCommandAttribute, this.commandOption);
}