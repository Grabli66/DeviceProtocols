/// Статус протокола General Option
class GenOptStatus {
  /// Исходное, "BLANK"
  static const Blank = GenOptStatus._(0x00);

  /// Исполнено с отчётом
  static const Report = GenOptStatus._(0x01);

  /// Исполнено успешно без отчёта
  static const WithReport = GenOptStatus._(0x02);

  /// Занято, идёт исполнение
  static const Busy = GenOptStatus._(0x03);

  /// Недопустимая команда
  static const BadRequest = GenOptStatus._(0x04);

  /// Недопустимая длина параметров
  static const BadParameterLength = GenOptStatus._(0x05);

  /// Недопустимое значение параметра
  static const BadParameterValue = GenOptStatus._(0x06);

  /// Таймаут
  static const Timeout = GenOptStatus._(0x07);

  /// Нет ответа по последовательному каналу или неверное начало пакета
  static const NoAnswer = GenOptStatus._(0x08);

  /// Значение
  final int value;

  /// Конструктор
  const GenOptStatus._(this.value);
}
