import 'dart:convert';

import 'package:device_protocols/common/exceptions.dart';

/// Формат пароля
enum Rtu327PasswordFormat { AsString, AsBCD }

/// Обёртка над строкой для представления пароля RTU327: STR<4>
class Rtu327Password {
  /// Значение пароля
  final String value;

  /// Формат пароля
  final Rtu327PasswordFormat format;

  /// Создаёт пароль с предварительной проверкой
  Rtu327Password(this.value, [this.format = Rtu327PasswordFormat.AsString]) {
    if (value.length > 4) {
      throw WrongPasswordFormat();
    }
  }

  /// Возвращает байты
  List<int> toBytes() {
    switch (format) {
      case Rtu327PasswordFormat.AsString:
        return utf8.encode(value);
      case Rtu327PasswordFormat.AsBCD:
        return [];
    }

    throw WrongPasswordFormat();
  }
}
