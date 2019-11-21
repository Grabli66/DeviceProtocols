/// Идентификатор обобщённой опции
class GeneralOption {
  /// Обобщённая опция
  static const ID = GeneralOption._(0x010B);
  
  /// Значение
  final int value;

  /// Конструктор
  const GeneralOption._(this.value);
}
