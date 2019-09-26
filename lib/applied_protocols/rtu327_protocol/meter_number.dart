/// Номер счётчика BCD5
class MeterNumber {
  /// Номер
  final int number;

  /// Конструктор
  MeterNumber(this.number);

  /// Создаёт из массива байт
  MeterNumber.fromBytes(List<int> data) : this(1);

  /// Возвращает массив из пяти BCD байт
  List<int> toBytes() {
    return [];
  }
}