import 'package:binary_data/binary_data_lib.dart';

/// Извлекатель бинарных пакетов
abstract class BinaryPacketExtractor {
  /// Читает бинарные данные
  final BinaryStreamReader reader;

  /// Конструктор
  BinaryPacketExtractor(this.reader);
}