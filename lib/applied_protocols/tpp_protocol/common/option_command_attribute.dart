/// Атрибуты команды опции являются флажками, определяющими способ исполнения команды.
class OptionCommandAttribute {
  static const Random = OptionCommandAttribute._(0x01);
  static const Repeat = OptionCommandAttribute._(0x02);
  static const Broadcast = OptionCommandAttribute._(0x04);
  static const Nack = OptionCommandAttribute._(0x08);
  static const Scheduler = OptionCommandAttribute._(0x10);
  static const Sensor = OptionCommandAttribute._(0x20);

  /// Значение
  final int value;

  /// Конструктор
  const OptionCommandAttribute._(this.value);
}
