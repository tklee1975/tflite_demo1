import 'package:flutter/material.dart';
import '../core/base_material_sample.dart';

class CustomPaintTest extends BaseMaterialSample {
  CustomPaintTest({super.key});

  static create() => CustomPaintTest();

  @override
  bool showTestMenu() => false; // ken:  show the page
  // bool showTestMenu() => true; // ken:  show the page

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

    return _buildTestWidget(context);
  }

  Widget _buildTestWidget(BuildContext context) {
    return Container(
      color: Colors.white,
      // width: double.infinity,
      // height: double.infinity,
      width: 300,
      height: 300,
      child: CustomPaint(
        painter: MyCustomPainterDemo2(),
      ),
    );
  }
}

// 1
class MyCustomPainterDemo2 extends CustomPainter {
  // 2
  @override
  void paint(Canvas canvas, Size size) {
    debugPrint("paint is called");

// 1
    Paint paintMountains = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.brown;
    // 2
    Paint paintSun = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.deepOrangeAccent;

    // 1
    // Paint paint = Paint()..style = PaintingStyle.stroke;
    // 2
    Path path = Path();
    // 3
    path.moveTo(0, 250);
    path.lineTo(100, 200);
    path.lineTo(150, 150);
    path.lineTo(200, 50);
    path.lineTo(250, 150);
    path.lineTo(300, 200);
    path.lineTo(size.width, 250);
    path.lineTo(0, 250);
    canvas.drawPath(path, paintMountains);

    // 4
    path = Path();
    path.moveTo(100, 100);
    path.addOval(Rect.fromCircle(center: const Offset(100, 100), radius: 25));

    // 5
    canvas.drawPath(path, paintSun);
  }

  // 4
  @override
  bool shouldRepaint(MyCustomPainterDemo2 oldDelegate) {
    return true;
  }
}

// 1
class MyCustomPainterDemo1 extends CustomPainter {
  // 2
  @override
  void paint(Canvas canvas, Size size) {
    debugPrint("paint is called");

    Offset startPoint = const Offset(0, 0);
    // 2
    Offset endPoint = Offset(size.width, size.height);
    // 3
    Paint paint = Paint();
    paint.color = Colors.red;
    // 4
    canvas.drawLine(startPoint, endPoint, paint);
  }

  // 4
  @override
  bool shouldRepaint(MyCustomPainterDemo1 oldDelegate) {
    return true;
  }
}
