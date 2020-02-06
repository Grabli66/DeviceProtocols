import 'package:binary_data/binary_data.dart';

/// Базовый класс для запросов и ответов
abstract class RTU327Packet {
  /// Конвертирует в байты
  BinaryData toBytes();
}
