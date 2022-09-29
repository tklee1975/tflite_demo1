import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

// The App Widget
class SampleBuilderiOSApp extends StatelessWidget {
  const SampleBuilderiOSApp({
    required Key key,
    required this.sampleMap,
  }) : super(key: key);

  final Map sampleMap; // = new Map();

  @override
  Widget build(BuildContext context) {
    // This app is designed only to work vertically, so we limit
    // orientations to portrait up and down.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    debugPrint("SampleApp: build!");

    return CupertinoApp(
      home: SampleBuilderiOSAppPage(key: const Key("home"), testMap: sampleMap),
    );
  }
}

class SampleBuilderiOSAppPage extends StatelessWidget {
  const SampleBuilderiOSAppPage({
    required Key key,
    required this.testMap,
  }) : super(key: key);

  final Map testMap; // = new Map();

  void defineTestMap() {}

  @override
  Widget build(BuildContext context) {
    // debugPrint("SampleAppPage: build!");
    // defineTestMap();

    return CupertinoPageScaffold(
        navigationBar: _buildNavBar(context),
        child: SafeArea(child: _buildListView(context)));
  }

  Widget _buildListView(BuildContext context) {
    //return const Text("Testing");
    return _buildListViewList(context, getItemList());
  }

  _buildNavBar(BuildContext context) {
    return const CupertinoNavigationBar(
      middle: Text("iOS Sample"),
    );
  }

  List<String> getItemList() {
    List<String> result = <String>[];

    for (String key in testMap.keys) {
      result.add(key);
    }

    return result;
  }

  Widget _buildListViewList(BuildContext context, List itemList) {
    return ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          //debugPrint("index=${index}");

          String itemName = itemList[index];

          return GestureDetector(
            child: _buildListItem(itemName),
            onTap: () {
              onListItemClick(context, itemName);
            },
          );

          //return Column(children: <Widget>[addPadding(Text(itemName), 10, 30)]);
          //
        });
  }

  Widget _buildListItem(String itemName) {
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(itemName),
      ),
    ]);
  }

  void onListItemClick(BuildContext context, String name) {
    debugPrint("onListItemClick: name=$name");
    Widget testWidget = testMap[name]();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => testWidget),
    );
  }
}
