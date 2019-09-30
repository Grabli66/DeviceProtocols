import 'dart:async';
import 'dart:typed_data';

import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/channel_protocols/m4_protocol/m4_frame_extractor.dart';
import 'package:device_protocols/channel_protocols/m4_protocol/m4_long_frame.dart';
import 'package:device_protocols/channel_protocols/m4_protocol/m4_short_frame.dart';
import 'package:test/test.dart';

void testM4Protocol() {
  group('M4 protocol tests', () {
    group('M4 channel protocol tests', () {
      test('LongFrame test', () {
        final long = M4LongFrame(
            0xFF, 0x0C, Uint8List.fromList([0x52, 0xF6, 0x00, 0x03, 0x00]));
        expect(long.toHex(), "02_ff_90_0c_00_05_00_52_f6_00_03_00_b9_28");
      });

      test('ShortFrame test', () {
        final short = M4ShortFrame(0xFF, Uint8List.fromList([1, 2, 3, 4, 5]));
        expect(short.toHex(), "02_ff_01_02_03_04_05_f1_16");
      });
    });

    group('M4 frame extractor tests', () {
      test('Extract long and short frame', () async {
        final binary = BinaryData();
        final long = M4LongFrame(
            0xFF, 0x0C, Uint8List.fromList([0x52, 0xF6, 0x00, 0x03, 0x00]));

        binary.writeBinaryData(long.toBytes());

        final short = M4ShortFrame(0xFF, Uint8List.fromList([1, 2, 3, 4, 5]));
        binary.writeBinaryData(short.toBytes());

        final data = binary.toList();
        final controller = StreamController<Object>();
        
        Future.delayed(Duration(seconds: 1), () {
          controller.add(data);
        });

        final stream = controller.stream;
        final extractor =
            M4FrameExtractor(BinaryStreamReader(stream));
        
        final respLong = await extractor.read();
        final respShort = await extractor.read();

        expect(respLong.toHex(), long.toHex());
        expect(respShort.toHex(), short.toHex());
      });
    });
  });
}

void main() {
  testM4Protocol();
}
