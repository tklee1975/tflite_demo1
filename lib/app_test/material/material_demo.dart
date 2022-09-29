import 'package:flutter/material.dart';

class MaterialDemo extends StatelessWidget {
  const MaterialDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.amber,
        child: const Center(
          child: Text(
            "Testing",
            style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}

class ThemeMaterialDemo extends StatelessWidget {
  const ThemeMaterialDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Container(
        color: Theme.of(context).backgroundColor,
        child: Center(
          child: Text(
            "Testing",
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
