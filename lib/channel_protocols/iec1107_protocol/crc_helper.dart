import 'package:binary_data/binary_data_lib.dart';

/// Утилита для расчёта BCC
abstract class CrcHelper {
  /// Считает BCC
  static int calcBcc(BinaryData data) {
    var sum = 0;
    for (var b in data) {
      sum = (sum ^ b) & 0xFF;
    }

    return sum;
  }
}
