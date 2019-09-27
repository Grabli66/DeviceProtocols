import 'package:test/test.dart';

import 'm4_protocol_test.dart';
import 'rtu327_protocol_test.dart';

void main() {
  group("All protocol tests", () {
    testM4Protocol();
    testRtu327Protocol();
  });
}
