import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/transport_protocols/rtu327_protocol/response_frame_extractor.dart';

void main(List<String> args) async {
  final bin = BinaryData.fromList([
    0x02,
    0x00,
    0x0d,
    0x21,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x00,
    0x5d,
    0x7a,
    0x27,
    0x6e,
    0x52,
    0xe1
  ]);

  final allData = BinaryData();

  for (var i = 0; i < 1000000; i++) {
    allData.writeBinaryData(bin);
  }

  final sr = BinaryStreamReader(Stream<int>.fromIterable(allData));
  final unpacker = ResponseFrameExtractor(sr);
  final sw = Stopwatch();
  sw.start();
  for (var i = 0; i < 1000000; i++) {
    await unpacker.read();
  }
  sw.stop();
  print(sw.elapsedMilliseconds);
}
