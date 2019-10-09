/// Обработчик канальных пакетов протокола IEC1107 на клиентской стороне
class IEC1107ClientChannelProtocolHandler {
  /// Устанавливает сессию
  void startSession(String network) {}

  /// Устанавливает режим работы
  void setMode(int speed, int mode) {}

  /// Читает данные командой R1
  void sendR1() {}
}
