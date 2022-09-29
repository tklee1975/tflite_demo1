import 'package:flutter/cupertino.dart';
import '../core/base_material_sample.dart';

class SimpleTest extends BaseMaterialSample {
  SimpleTest({super.key});

  static create() => SimpleTest();

  @override
  //bool showTestMenu() => false; // ken:  show the page
  bool showTestMenu() => true; // ken:  show the page

  @override
  Map<String, Function> defineTestMap() {
    return {
      "hello": testHello,
      "testWithContext": testWithContext,
    };
  }

  void testHello() {
    debugPrint("Hello Flutter!!");
    setConsole("Hello Flutter!!");
  }

  void testWithContext(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    debugPrint("Size: $size");
  }

  @override
  Widget getCustomMain(BuildContext context) {
    if (showTestMenu()) {
      return buildTestConsole(context);
    }

    return _buildTestWidget(context);
  }

  Widget _buildTestWidget(BuildContext context) {
    return const Center(
        child: Text(
      'testing',
    ));
  }
}
