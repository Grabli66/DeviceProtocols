import 'package:binary_data/binary_data_lib.dart';
import 'package:device_protocols/applied_protocols/rtu327_protocol/requests/get_time_request.dart';
import 'package:device_protocols/applied_protocols/rtu327_protocol/responses/get_time_response.dart';
import 'package:device_protocols/rtu327_protocol/response_code.dart';
import 'package:device_protocols/transport_protocols/rtu327_protocol/request_frame.dart';
import 'package:device_protocols/transport_protocols/rtu327_protocol/response_frame.dart';
import 'package:device_protocols/transport_protocols/rtu327_protocol/response_frame_extractor.dart';
import 'package:device_protocols/transport_protocols/rtu327_protocol/rtu327_password.dart';
import 'package:test/test.dart';

void main() {
  group('Rtu327 tests', () {
    group('Request tests', () {
      test('GetTimeRequest', () {
        final frame =
            RequestFrame(11, Rtu327Password("0001"), GetTimeRequest().toBytes());
        expect(
            frame.toBytes().toHex(), "02_00_09_0b_30_30_30_31_00_00_72_21_e8");
      });
    });

    group('Response unpacker tests', () {
      test('Unpack GetTimeResponse', () async {
        final frame = ResponseFrame(
            33, ResponseCode.Ok, GetTimeResponse(DateTime.now()).toBytes());
        final dataStream = Stream.fromIterable(frame.toBytes());
        final unpacker = ResponseFrameExtractor(BinaryStreamReader(dataStream));
        final responseFrame = await unpacker.read();

        expect(frame.toHex(), responseFrame.toHex());
      });
    });
  });
}
