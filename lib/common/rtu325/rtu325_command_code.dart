/// Код комманды RTU325
class RTU325CommandCode {
  ///  Взять время с УСПД
  static const GetRtuTimeCommand = RTU325CommandCode(0x06);

  /// Код команды
  final int code;

  /// Конструктор
  const RTU325CommandCode(this.code);

  /// Сравнивает объекты
  operator ==(Object other) {
    if (other is RTU325CommandCode) {
      code == other.code;
    }

    return false;
  }
}