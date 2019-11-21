/// Идентификатор опции
class DeviceOption {
  /// Опция (совместимая собобщённой) для прибора учёта электроэнергии "Меркурий М230"
  static const MeterSmartM230 = DeviceOption._(0x0113);

  /// Значение
  final int value;

  /// Конструктор
  const DeviceOption._(this.value);
}
