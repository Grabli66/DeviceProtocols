import 'dart:async';
import 'dart:typed_data';

import 'package:binary_data/binary_data_lib.dart';
import 'package:meta/meta.dart';

/// Базовый канал для приёма/передачи бинарных данных
abstract class BinaryTransportChannel {
  /// Для чтения бинарных данных из канала
  @protected
  final BinaryStreamReader streamReader;

  /// Конструктор
  BinaryTransportChannel(this.streamReader);

  /// Отправляет байт
  @protected
  void sendByte(int byte);

  /// Отправляет список
  @protected
  void sendList(Uint8List data);
}
