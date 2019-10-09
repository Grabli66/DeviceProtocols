/// Базовый обработчик пакетов прикладного уровня
abstract class AppliedProtocolHandler<TResponse> {
  /// Запускает работу и по окончанию возвращает результат типа [TResponse]
  Future<TResponse> start();
}
