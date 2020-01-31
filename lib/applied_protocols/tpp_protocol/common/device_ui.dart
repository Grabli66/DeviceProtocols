import 'package:binary_data/binary_data.dart';

/// Описывает уникальный идентификатор
class DeviceEui {
  /// Бинарное представление EUI
  final BinaryData _data;

  /// Конструктор
  DeviceEui._(this._data);

  /// Создаёт из строки
  factory DeviceEui.fromHexString(String value) {
    return null;
  }

  /// Возвращает в виде списка байт
  List<int> toBytes() {
    return _data.getList();
  }

  /// Возвращает в виде HEX строки
  String toHex() {
    return _data.toHex();
  }
}
