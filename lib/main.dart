import 'package:flutter/material.dart';
import 'app.dart';
import 'app_test/test_list.dart';

// const bool kTestMode = false;
const bool kTestMode = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var app = kTestMode ? const TestList() : const MainApp();
  runApp(app);
}
