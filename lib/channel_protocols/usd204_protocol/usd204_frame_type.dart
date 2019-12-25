/// Тип фрейма
class Usd204FrameType {
  /// Значение
  final int value;

  /// Запрос
  static const Request = Usd204FrameType._(0x01);

  /// Ответ
  static const Response = Usd204FrameType._(0x10);

  /// Подтверждение
  static const Ack = Usd204FrameType._(0x02);

  /// Запрос повтора
  static const Repeat = Usd204FrameType._(0x04);

  /// Ping
  static const Ping = Usd204FrameType._(0x08);

  /// Конструктор
  const Usd204FrameType._(this.value);
}