import 'package:flutter/material.dart';
import '../core/base_material_sample.dart';

class GestureTest extends BaseMaterialSample {
  GestureTest({super.key});

  static create() => GestureTest();

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
    // if (showTestMenu()) {
    //   return buildTestConsole(context);
    // }

    return const Center(child: MyWidget());
  }

  // ignore: unused_element
  Widget _buildTestWidget(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      // onTapUp: (details) => onTapUp(details, context),
      onPanUpdate: (detail) {
        // print("its Dragged");
        // print("global dx : " + detail.globalPosition.dx.toString());
        // print("global dy : " + detail.globalPosition.dy.toString());

        var renderObj = context.findRenderObject();
        debugPrint("renderObj : $renderObj");

        RenderBox box = renderObj as RenderBox;
        debugPrint("renderBox : $box");

        // Offset local = box.globalToLocal(detail.globalPosition);
        // print("local dx : " + local.dx.toString());
        // print("local dy : " + local.dy.toString());
      },
      child: RepaintBoundary(
        child: Center(
          child: Container(
            color: Colors.amberAccent,
            width: 300,
            height: 100,
            child: const Text(
              'Gesture Testing',
            ),
          ),
        ),
      ),
    );
  }

  onTap() {
    debugPrint("onTap is called");
  }

  onTapUp(TapUpDetails details, BuildContext context) {
    debugPrint(
        "onTap is called: ${details.localPosition} ${details.globalPosition}");
    final box = context.findRenderObject() as RenderBox;
    debugPrint("box: $box");
    final point = box.globalToLocal(details.globalPosition);
    debugPrint("point: $point");
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      // onTapUp: (details) => onTapUp(details, context),
      onPanUpdate: (detail) {
        // print("its Dragged");
        // print("global dx : " + detail.globalPosition.dx.toString());
        // print("global dy : " + detail.globalPosition.dy.toString());

        var renderObj = context.findRenderObject();
        debugPrint("renderObj : $renderObj");

        RenderBox box = renderObj as RenderBox;
        debugPrint("renderBox : $box");

        // Offset local = box.globalToLocal(detail.globalPosition);
        // print("local dx : " + local.dx.toString());
        // print("local dy : " + local.dy.toString());
      },
      child: Container(
        color: Colors.amberAccent,
        width: 300,
        height: 100,
        child: const Text(
          'Gesture Testing',
        ),
      ),
    );
  }

  onTap() {
    debugPrint("onTap is called");
  }

  onTapUp(TapUpDetails details, BuildContext context) {
    debugPrint(
        "onTap is called: ${details.localPosition} ${details.globalPosition}");
    final box = context.findRenderObject() as RenderBox;
    debugPrint("box: $box");
    final point = box.globalToLocal(details.globalPosition);
    debugPrint("point: $point");
  }
}
