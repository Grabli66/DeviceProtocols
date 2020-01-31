/// Код ответа RTU325
class RTU325ResponseCode {
  /// Успех
  static const Ok = RTU325ResponseCode(0x00);

  /// Ошибка (Неизвестная)
  static const Error = RTU325ResponseCode(0x01);

  /// Нет данных
  static const NoData = RTU325ResponseCode(0x02);

  /// Соединение не установлено
  static const NoConnection = RTU325ResponseCode(0x03);

  /// Недостаточно прав доступа
  static const AccessDenined = RTU325ResponseCode(0x04);

  /// Запрос не поддерживается
  static const RequestNotSupported = RTU325ResponseCode(0x05);

  /// Параметры в запросе не соответствуют конфигурации УСПД
  static const WrongRequestParameters = RTU325ResponseCode(0x06);

  /// Код команды
  final int code;

  /// Конструктор
  const RTU325ResponseCode(this.code);

  /// Сравнивает объекты
  operator ==(Object other) {
    if (other is RTU325ResponseCode) {
      code == other.code;
    }

    return false;
  }
}
