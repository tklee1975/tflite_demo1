// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'core/sample_builder_mat_app.dart';

import 'test/custom_paint_test.dart';
import 'test/gesture_test.dart';
import 'test/simple_test.dart';

// The App Widget
// Material Samples
class TestList extends StatelessWidget {
  const TestList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This app is designed only to work vertically, so we limit
    // orientations to portrait up and down.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    debugPrint("SampleApp: build!");

    return const SampleBuilderMatApp(
      sampleMap: {
        'GestureTest': GestureTest.create,
        'CustomPaintTest': CustomPaintTest.create,
        'Simple Test': SimpleTest.create,
      },
      key: Key('SampleApp'),
    );
  }
}
