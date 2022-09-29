// ignore_for_file: no_logic_in_create_state

import 'package:flutter/cupertino.dart';

class TestConsole extends StatefulWidget {
  final _TestConsoleState _state = _TestConsoleState();

  TestConsole({super.key});
  // _{WidgetName}State
  @override

  // ignore: library_private_types_in_public_api
  _TestConsoleState createState() {
    return _state;
  }

  //
  void setContent(String content) => _state.setContent(content);
  void appendContent(String content) => _state.appendContent(content);
}

class _TestConsoleState extends State<TestConsole> {
  String _content = "";

  void setContent(String content) {
    setState(() {
      _content = content;
    });
    //counter += value;
  }

  void appendContent(String newContent) {
    setState(() {
      _content = "$newContent\n$_content";
    });
    //counter += value;
  }

  @override
  void initState() {
    super.initState();
    _content = "";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            color: CupertinoColors.systemGrey3,
            height: 400,
            child: SingleChildScrollView(
                child: ListBody(children: [Text(_content)]))));
  }
}
