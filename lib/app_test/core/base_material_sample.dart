import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'test_console.dart';

abstract class BaseMaterialSample extends StatelessWidget {
  final _testMap = {};
  final TestConsole testConsole = TestConsole();

  BaseMaterialSample({super.key});

// ken: define this Test Name & Function Map
  // Sample Code:
  // Map<String, Function> defineTestMap() {
  //    return {"hello":hellFunc, "testAAA":testAAA}
  // }
  //

  Map<String, Function> defineTestMap();
  Widget? getCustomMain(BuildContext context) {
    return null;
  }

  @protected
  void setup(BuildContext context) {}

  @protected
  void setupRoutes(Map<String, Widget Function(BuildContext)> routes) {}

  @override
  Widget build(BuildContext context) {
    setup(context);
    _setupTestMap();

    var routes = <String, Widget Function(BuildContext)>{};
    setupRoutes(routes);
    debugPrint("routes: $routes");

    // customEasyLoadingStyle();

    return MaterialApp(
      theme: ThemeData(
        fontFamily: "NotoSansTC",
        // primaryColor: kPrimaryColor,
      ),
      initialRoute: '/',
      routes: routes,
      home: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildMainContent(context),
      ),
      // builder: EasyLoading.init(),
    );

    // return CupertinoApp(
    //     home: CupertinoPageScaffold(
    //         navigationBar: _buildNavBar(context),
    //         child: _buildMainContent(context)));
  }

  void pushPage(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  void clearConsole() {
    testConsole.setContent("");
  }

  void setConsole(String content) {
    testConsole.setContent(content);
  }

  void appendConsole(String string) {
    testConsole.appendContent(string);
  }

  void _setupTestMap() {
    Map<String, Function> userMap = defineTestMap();

    for (String key in userMap.keys) {
      _testMap[key] = userMap[key];
    }
  }

  Widget _buildMainContent(BuildContext context) {
    return SafeArea(
        child: Stack(children: <Widget>[
      _buildMainArea(context),
      _buildTestMenu(context),
    ]));
  }

  Widget buildTestConsole(BuildContext context) {
    return Container(
      //decoration: BoxDecoration(color: Color.fromRGBO(255, 0, 0, 255)),
      color: CupertinoColors.systemGrey5,
      //decoration: BoxDecoration(color: Color.fromRGBO(255, 0, 0, 255)),
      child: testConsole,
      //padding: EdgeInsets.all(10),
    );
  }

  Widget _buildMainArea(BuildContext context) {
    Widget? widget = getCustomMain(context);
    widget ??= testConsole;

    // Allow override
    //Widget
    return Container(
      color: CupertinoColors.systemGrey5,
      child: widget,
    );
  }

  //
  //  {
  //   testMap["hello"] = hello;
  // }

  //I<String> getTestList() {
  //   return _testMap.keys;
  //   // var array = [
  //   //   'test_hello',
  //   //   'test_string',
  //   // ];

  //   // return array;
  // }

  bool showTestMenu() => true;

  void hello() {
    debugPrint("hello!");
  }

  void _runTestMethod(String testName, BuildContext context) {
    //Function func = ;

    // try to call with context method
    var didRun = false;
    try {
      _testMap[testName](context);
      didRun = true;
    } on NoSuchMethodError {
      //print("Testing: cannot find $testName(context)");
    }

    if (didRun) {
      return;
    }

    try {
      _testMap[testName]();
    } on NoSuchMethodError {
      debugPrint("Testing: Fail to run the test $testName");
    }
  }

  Widget _buildTestMenu(BuildContext context) {
    if (showTestMenu() == false) {
      return const SizedBox.shrink(); // ken: empty box
    }

    //List<String> testList = getTestList();

    List<Widget> buttonList = <Widget>[];
    for (String test in _testMap.keys) {
      debugPrint("_buildTestButton: test=$test");

      //buttonList.add(Text("test: " + test));
      buttonList.add(CupertinoButton(
        onPressed: () {
          _runTestMethod(test, context);
          // Navigator.pop(context);
        },
        child: Text("Test: $test"),
      ));
    }

    return SafeArea(child: Column(children: buttonList));
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(runtimeType.toString()),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  // _buildNavBar(BuildContext context) {
  //   return CupertinoNavigationBar(
  //       middle: Text(runtimeType.toString()),
  //       leading: CupertinoNavigationBarBackButton(onPressed: () {
  //         Navigator.pop(context);
  //       }));
  // }
}
