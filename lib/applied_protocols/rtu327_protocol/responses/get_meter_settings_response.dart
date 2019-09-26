import 'dart:typed_data';

import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/applied_protocols/rtu327_protocol/responses/response.dart';

/// Ответ на запрос параметров счетчика, GETSHPRM
class GetMeterSettingsRequest extends Response {
  /// Версия параметров ( текущее значение 1)
  final int parameterVersion;

  /// Тип счётчика
  final int meterType;

  /// Коэффициент трансформации по току
  final double currentRatio;

  /// Коэффициент трансформации по напряжению
  final double voltageRatio;

  /// Множитель
  final double multiplier;

  /// Интервал профиля нагрузки
  final int archiveInterval;

  /// Тип общекта в базе РТУ
  final int objectType;

  /// Номер объекта в базе РТУ
  final int objectNumber;

  /// Номер фидера
  final int fiderNumber;

  /// Конструктор
  GetMeterSettingsRequest(
      this.parameterVersion,
      this.meterType,
      this.currentRatio,
      this.voltageRatio,
      this.multiplier,
      this.archiveInterval,
      [this.objectType = 0,
      this.objectNumber = 0,
      this.fiderNumber = 0]);

  /// Создаёт ответ из байт
  factory GetMeterSettingsRequest.fromBytes(Uint8List data) {
    final binary = BinaryData.fromList(data);
    final parameterVersion = binary.readUInt16();
    final meterType = binary.readUInt8();
    final currentRatio = binary.readFloat64();
    final voltageRatio = binary.readFloat64();
    final multiplier = binary.readFloat64();
    final archiveInterval = binary.readUInt8();
    final objectType = binary.readUInt32();
    final objectNumber = binary.readUInt32();
    final fiderNumber = binary.readUInt32();

    return GetMeterSettingsRequest(
        parameterVersion,
        meterType,
        currentRatio,
        voltageRatio,
        multiplier,
        archiveInterval,
        objectType,
        objectNumber,
        fiderNumber);
  }

  /// Конвертирует в байты
  @override
  BinaryData toBytes() {
    final res = super.toBytes();
    res.writeUInt16(parameterVersion);
    res.writeUInt8(meterType);
    res.writeUInt8(meterType);
    res.writeFloat64(currentRatio);
    res.writeFloat64(voltageRatio);
    res.writeFloat64(multiplier);
    return res;
  }
}
