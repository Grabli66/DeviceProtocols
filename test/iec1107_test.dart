import 'package:device_protocols/channel_protocols/iec1107_protocol/requests/iec1107_ident_request.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/responses/ident_response.dart';
import 'package:device_protocols/channel_protocols/iec1107_protocol/responses/info_response.dart';
import 'package:test/test.dart';

void testIEC1107() {
  group('IEC1107 tests', () {
    test('Ident request test', () {
      final req1 = IEC1107IdentRequest("24");
      final req2 = IEC1107IdentRequest("231");
      expect(req1.toString(), "/?24!\r\n");
      expect(req2.toString(), "/?231!\r\n");
    });

    test('Ident response test', () {
      final resp1 = IdentResponse("2", "3", "4");
      final resp2 = IdentResponse("5", "5", "6");
      expect(resp1.toString(), "/?234\r\n");
      expect(resp2.toString(), "/?556\r\n");
    });

    test('Info response test', () {
      final resp1 = InfoResponse("1234", isProgramm: false);      
      expect(resp1.toString(), "\x021234!\r\n\x03#");
    });
  });
}

void main() {
  testIEC1107();
}
