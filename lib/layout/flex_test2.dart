import 'package:flutter/material.dart';

class FlexTest2 extends StatefulWidget {
  const FlexTest2({super.key});

  @override
  State<FlexTest2> createState() => _FlexTest2State();
}

class _FlexTest2State extends State<FlexTest2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("FlexTest2"),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 100, maxHeight: 100),
          child: Row(children: <Widget>[
            Expanded(flex: 2, child: Container(color: Colors.amber)),
            Flexible(flex: 1, child: Container(color: Colors.blue)),
          ]),
        ));
  }
}
