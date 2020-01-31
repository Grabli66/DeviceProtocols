import 'dart:typed_data';

import 'package:binary_data/binary_data.dart';

/// Базовый канал для приёма/передачи бинарных данных
abstract class BinaryTransportChannel {
  /// Для чтения бинарных данных из канала
  final BinaryStreamReader streamReader;

  /// Конструктор
  BinaryTransportChannel(this.streamReader);

  /// Отправляет байт  
  void sendByte(int byte);

  /// Отправляет список
  void sendList(Uint8List data);
}
