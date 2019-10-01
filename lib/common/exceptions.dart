/// Базовое исключение этой библиотеки
abstract class ProtocolException implements Exception {}

/// Получен пакет который невозможно обработать. Например: не реализовано
class UnsupportedPacketException implements ProtocolException {}

/// Исключение когда CRC не сошлась
class WrongCrcException implements ProtocolException {}

/// Исключение когда пароль неправильного формата
class WrongPasswordFormat implements ProtocolException {}