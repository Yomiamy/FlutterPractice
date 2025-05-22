import 'package:flutter/material.dart';

class ColumnTest1 extends StatelessWidget {
  const ColumnTest1({super.key});

  @override
  Widget build(BuildContext context) {
    const String flavorConfig =
        String.fromEnvironment("FLAVOR", defaultValue: "NONE");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ColumnTest1-$flavorConfig",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: const SizedBox.expand(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Text('Text 1', style: TextStyle(fontSize: 22)),
            Text('Text 2', style: TextStyle(fontSize: 22)),
          ])),
    );
  }
}
