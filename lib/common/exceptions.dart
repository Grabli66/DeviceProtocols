/// Базовое исключение этой библиотеки
abstract class ProtocolException implements Exception {
  /// Сообщение
  final String message;

  /// Конструктор
  ProtocolException(this.message);

  @override
  String toString() {
    return "$message";
  }
}

/// Ошибка неправильного аргумента(метода)
class WrongArgumentException extends ProtocolException {
  /// Конструктор
  WrongArgumentException([String message]) : super(message);

  @override
  String toString() {
    return "WrongArgumentException. ${message ?? ""}";
  }
}

/// Получен пакет неправильного формата
class WrongPacketFormatException extends ProtocolException {
  /// Конструктор
  WrongPacketFormatException([String message]) : super(message);

  @override
  String toString() {
    return "WrongPacketFormat. ${message ?? ""}";
  }
}

/// Получен пакет который невозможно обработать. Например: не реализовано
class UnsupportedPacketException extends ProtocolException {
  /// Конструктор
  UnsupportedPacketException([String message]) : super(message);

  @override
  String toString() {
    return "UnsupportedPacket. ${message ?? ""}";
  }
}

/// Исключение когда CRC не сошлась
class WrongCrcException extends ProtocolException {
  /// Конструктор
  WrongCrcException([String message]) : super(message);

  @override
  String toString() {
    return "WrongCrcException. ${message ?? ""}";
  }
}

/// Исключение когда пароль неправильного формата
class WrongPasswordFormat extends ProtocolException {
  /// Конструктор
  WrongPasswordFormat([String message]) : super(message);

  @override
  String toString() {
    return "WrongPasswordFormat. ${message ?? ""}";
  }
}
