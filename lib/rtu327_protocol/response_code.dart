/// Коды ответов
class ResponseCode {
  /// Всё нормально
  static const Ok = 0;

  /// Ошибка сервера
  static const ServerError = 1;

  /// Данных больше нет
  static const NoMoreData = 2;

  /// Ошибка базы данных
  static const DatabaseError = 3;

  /// Прибор не обнаружен в базе
  static const NoMeter = 4;

  /// Неверная команда
  static const WrongCommand = 5;

  /// Неверные параметры команды
  static const WrongCommandParameters = 6;

  /// Неправильный интервал в запросе
  static const WrongInterval = 7;

  /// Нет данных за указанный интервал
  static const NoData = 8;

  /// Неправильный пароль
  static const WrongPassword = 10;

  /// Нет прав для выполнения команды
  static const NoRights = 11;

  /// CRC не сошлось
  static const WrongCrc = 60;
}
