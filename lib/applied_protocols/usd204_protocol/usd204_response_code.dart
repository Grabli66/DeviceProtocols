/// Коды ответов
class USD204ResponseCode {
  /// Код ответа
  final int code;

  /// Конструктор
  USD204ResponseCode(this.code);

  /// Сравнивает объекты
  operator ==(Object other) {
    if (other is USD204ResponseCode) {
      code == other.code;
    }

    return false;
  }
}
