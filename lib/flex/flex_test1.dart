import 'package:flutter/material.dart';

class FlexTest1 extends StatelessWidget {
  const FlexTest1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FlexTest1', style: TextStyle(fontSize: 30))
        ),
        body: Column(
        children: <Widget>[
          Expanded(flex: 3, child: Container(color: Colors.green, height: 100)),
          Expanded(flex: 7, child: Container(color: Colors.red, height: 100)),
        ]
      ),
    );
  }
}
