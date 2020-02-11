import 'package:binary_data/binary_data.dart';
import 'package:device_protocols/channel_protocols/modbus_protocol/modbus_channel_protocol.dart';

/// Функция создающая извлекателя данных функции
typedef ModbusRtuFunctionDataExtractor ModbusRtuFunctionDataExtractorCreatorFunc(BinaryStreamReader stream);