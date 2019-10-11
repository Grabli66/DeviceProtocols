/// Тип скорости протокола IEC1107
enum IEC1107SpeedType {
  Baud300,
  Baud600,
  Baud1200,
  Baud2400,
  Baud4800,
  Baud9600,
  Custom6,
  Custom7,
  Custom8,
  Custom9
}

/// Базовый класс скорости протокола IEC1107
abstract class IEC1107Speed {
  /// Тип скорости
  final IEC1107SpeedType speedType;

  /// Конструктор
  const IEC1107Speed(this.speedType);

  factory IEC1107Speed.fromString(String value) {
    return IEC1107SpeedB.fromString(value) ?? IEC1107SpeedC.fromString(value);
  }
}

/// Скорость режима B
class IEC1107SpeedB extends IEC1107Speed {
  /// Скорость 600 бод
  static const Baud600 = IEC1107SpeedB._(IEC1107SpeedType.Baud600);

  /// Скорость 1200 бод
  static const Baud1200 = IEC1107SpeedB._(IEC1107SpeedType.Baud1200);

  /// Скорость 2400 бод
  static const Baud2400 = IEC1107SpeedB._(IEC1107SpeedType.Baud2400);

  /// Скорость 4800 бод
  static const Baud4800 = IEC1107SpeedB._(IEC1107SpeedType.Baud4800);

  /// Скорость 9600 бод
  static const Baud9600 = IEC1107SpeedB._(IEC1107SpeedType.Baud9600);

  /// Скорость определяемая производителем "F"
  static const Custom6 = IEC1107SpeedB._(IEC1107SpeedType.Custom6);

  /// Скорость определяемая производителем "G"
  static const Custom7 = IEC1107SpeedB._(IEC1107SpeedType.Custom7);

  /// Скорость определяемая производителем "H"
  static const Custom8 = IEC1107SpeedB._(IEC1107SpeedType.Custom8);

  /// Скорость определяемая производителем "I"
  static const Custom9 = IEC1107SpeedB._(IEC1107SpeedType.Custom9);

  /// Конструктор
  const IEC1107SpeedB._(IEC1107SpeedType speedType) : super(speedType);

  /// Создаёт из строки
  factory IEC1107SpeedB.fromString(String value) {
    switch (value) {
      case "A":
        return Baud600;
      case "B":
        return Baud1200;
      case "C":
        return Baud2400;
      case "D":
        return Baud4800;
      case "E":
        return Baud9600;
      case "F":
        return Custom6;
      case "G":
        return Custom7;
      case "H":
        return Custom8;
      case "I":
        return Custom9;
    }

    return null;
  }

  @override
  String toString() {
    return super.toString();
  }
}

/// Скорость режима B
class IEC1107SpeedC extends IEC1107Speed {
  /// Скорость 300 бод
  static const Baud300 = IEC1107SpeedC._(IEC1107SpeedType.Baud300);

  /// Скорость 600 бод
  static const Baud600 = IEC1107SpeedC._(IEC1107SpeedType.Baud600);

  /// Скорость 1200 бод
  static const Baud1200 = IEC1107SpeedC._(IEC1107SpeedType.Baud1200);

  /// Скорость 2400 бод
  static const Baud2400 = IEC1107SpeedC._(IEC1107SpeedType.Baud2400);

  /// Скорость 4800 бод
  static const Baud4800 = IEC1107SpeedC._(IEC1107SpeedType.Baud4800);

  /// Скорость 9600 бод
  static const Baud9600 = IEC1107SpeedC._(IEC1107SpeedType.Baud9600);

  /// Скорость определяемая производителем "6"
  static const Custom6 = IEC1107SpeedC._(IEC1107SpeedType.Custom6);

  /// Скорость определяемая производителем "7"
  static const Custom7 = IEC1107SpeedC._(IEC1107SpeedType.Custom7);

  /// Скорость определяемая производителем "8"
  static const Custom8 = IEC1107SpeedC._(IEC1107SpeedType.Custom8);

  /// Скорость определяемая производителем "9"
  static const Custom9 = IEC1107SpeedC._(IEC1107SpeedType.Custom9);

  /// Конструктор
  const IEC1107SpeedC._(IEC1107SpeedType speedType) : super(speedType);

  /// Создаёт из строки
  factory IEC1107SpeedC.fromString(String value) {
    switch (value) {
      case "0":
        return Baud300;
      case "1":
        return Baud600;
      case "2":
        return Baud1200;
      case "3":
        return Baud2400;
      case "4":
        return Baud4800;
      case "5":
        return Baud9600;
      case "6":
        return Custom6;
      case "7":
        return Custom7;
      case "8":
        return Custom8;
      case "9":
        return Custom9;
    }

    return null;
  }

  @override
  String toString() {
    return super.toString();
  }
}
