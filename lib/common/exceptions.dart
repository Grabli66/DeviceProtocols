/// Базовое исключение этой библиотеки
abstract class ProtocolException implements Exception {}

/// Исключение когда CRC не сошлась
class WrongCrcException implements ProtocolException {}

/// Исключение когда пароль неправильного формата
class WrongPasswordFormat implements ProtocolException {}