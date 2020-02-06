/// Код функции
class ModbusFunctionCode {
  /// Чтение значений из нескольких регистров флагов (Read Coil Status)
  static const ReadCoilStatus = ModbusFunctionCode(0x01);

  /// Чтение значений из нескольких дискретных входов (Read Discrete Inputs)
  static const ReadDiscreteInputs = ModbusFunctionCode(0x02);

  /// Чтение значений из нескольких регистров хранения (Read Holding Registers)
  static const ReadHoldingRegisters = ModbusFunctionCode(0x03);

  /// Чтение значений из нескольких регистров ввода (Read Input Registers)
  static const ReadInputRegisters = ModbusFunctionCode(0x04);

  /// Код команды
  final int code;

  /// Конструктор
  const ModbusFunctionCode(this.code);

  /// Сравнивает объекты
  operator ==(Object other) {
    if (other is ModbusFunctionCode) {
      code == other.code;
    }

    return false;
  }
}
