/// Команды IEC1107
class IEC1107CommandType {
  /// Команда передачи ключа пароля
  static const P0 = IEC1107CommandType("P0");

  /// Команда передачи пароля
  static const P1 = IEC1107CommandType("P1");

  /// Команда чтения
  static const R1 = IEC1107CommandType("R1");

  /// Команда Записи
  static const W1 = IEC1107CommandType("W1");

  final String command;

  /// Конструктор
  const IEC1107CommandType(this.command);

  @override
  String toString() {    
    return command;
  }
}
