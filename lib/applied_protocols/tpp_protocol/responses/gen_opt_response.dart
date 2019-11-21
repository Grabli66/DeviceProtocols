import 'package:device_protocols/applied_protocols/tpp_protocol/common/device_ui.dart';
import 'package:device_protocols/applied_protocols/tpp_protocol/common/gen_opt_packet.dart';
import 'package:device_protocols/applied_protocols/tpp_protocol/common/gen_opt_status.dart';
import 'package:device_protocols/applied_protocols/tpp_protocol/common/general_option.dart';
import 'package:device_protocols/applied_protocols/tpp_protocol/common/option_command.dart';
import 'package:device_protocols/applied_protocols/tpp_protocol/common/option_command_attribute.dart';

/// Базовый ответ формата обобщённой опции
abstract class GenOptResponse extends GenOptPacket {
  /// Конструктор
  GenOptResponse(
      DeviceEui eui,
      GeneralOption option,
      GenOptStatus status,
      OptionCommandAttribute optionCommandAttribute,
      OptionCommand commandOption)
      : super(eui, option, status, optionCommandAttribute, commandOption);
}
