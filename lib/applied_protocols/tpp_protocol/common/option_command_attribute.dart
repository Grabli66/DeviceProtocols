/// Атрибуты команды опции являются флажками, определяющими способ исполнения команды.
class OptionCommandAttribute {
  static const Random = 0x01;
  static const Repeat = 0x02;
  static const Broadcast = 0x04;
  static const Nack = 0x08;
  static const Scheduler = 0x10;
  static const Sensor = 0x20;
}
