/// Тип комманды
class USD204CommandType {
  /// Запрос серийного номера, места установки и названия объекта
  static const SerialCommand = USD204CommandType(0x0009);

  /// Код команды
  final int command;

  /// Конструктор
  const USD204CommandType(this.command);

  /// Сравнивает объекты
  operator ==(Object other) {
    if (other is USD204CommandType) {
      command == other.command;
    }

    return false;
  }
}
