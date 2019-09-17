/// Специальные символы протокола
abstract class SpecialBytes {
  /// Начала заголовка
  static const SOH = 0x01;
  /// Начало кадра данных
  static const STX = 0x02;
  /// Конец кадра данных
  static const ETX = 0x03;
  /// Символ конца в неполном блоке
  static const EOT = 0x04;
  /// Подтверждение получения
  static const ACK = 0x06;
  /// Повтор запроса
  static const NAK = 0x15;
}
