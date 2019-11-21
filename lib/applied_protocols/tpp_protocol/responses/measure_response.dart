import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/applied_protocols/tpp_protocol/common/device_option.dart';
import 'package:device_protocols/applied_protocols/tpp_protocol/common/device_ui.dart';
import 'package:device_protocols/applied_protocols/tpp_protocol/common/gen_opt_status.dart';
import 'package:device_protocols/applied_protocols/tpp_protocol/common/general_option.dart';
import 'package:device_protocols/applied_protocols/tpp_protocol/common/option_command.dart';
import 'package:device_protocols/applied_protocols/tpp_protocol/common/option_command_attribute.dart';
import 'package:device_protocols/applied_protocols/tpp_protocol/responses/gen_opt_response.dart';

/// Пакет с измерением
class MeasureResponse extends GenOptResponse {
  /// Опция прибора
  final DeviceOption deviceOption;

  /// Номер пакета
  final int sequence;

  /// Флаги указывающие что в пакете 1
  final int flags0;

  /// Флаги указывающие что в пакете 2
  final int flags1;

  /// Конструктор
  MeasureResponse(DeviceEui eui, OptionCommand commandOption, this.deviceOption,
      this.sequence, this.flags0, this.flags1)
      : super(eui, GeneralOption.ID, GenOptStatus.Report,
            OptionCommandAttribute.Scheduler, commandOption);

  /// Преобразует пакет в байты
  @override
  BinaryData toBytes() {
    final result = super.toBytes();

    // логический статус опции
    result.writeUInt8(GenOptStatus.Report.value);
    result.writeUInt16(deviceOption.value);
    result.writeUInt8(flags0);
    result.writeUInt8(flags1);

    return result;
  }
}
