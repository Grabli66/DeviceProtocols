import 'package:device_protocols/applied_protocols/m4_protocol/requests/m4_request.dart';
import 'package:device_protocols/channel_protocols/m4_protocol/m4_frame.dart';

/// Данные извлечённые из фрэйма
class M4RequestExtractedData {
  /// Исходный фрейм
  final M4Frame frame;

  /// Извлечённый запрос
  final M4Request request;

  /// Конструктор
  M4RequestExtractedData(this.frame, this.request);
}