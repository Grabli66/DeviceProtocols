/// Режимы работы по протоколу IEC1107
class IEC1107WorkMode {
  /// Режим чтения
  static const readMode = IEC1107WorkMode._(0);

  /// Режим программирования
  static const programMode = IEC1107WorkMode._(1);

  /// Значение в виде целого числа
  final int value;

  /// Приватный конструктор
  const IEC1107WorkMode._(this.value);

  /// Создаёт из строки
  factory IEC1107WorkMode.fromString(String value) {
    switch (value) {
      case "0":
        return readMode;
      case "1":
        return programMode;
    }

    return null;
  }

  /// Сравнивает объекты
  operator ==(Object other) {
    if (other is IEC1107WorkMode) {
      return value == other.value;
    }

    return false;
  }
}
