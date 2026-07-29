import 'package:flutter/material.dart';

class AlignTest1 extends StatelessWidget {
  const AlignTest1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AlignTest1', style: TextStyle(fontSize: 30)),
        ),
        body: const Align(
          alignment: Alignment.center,
          heightFactor: 2,
          widthFactor: 2,
          child: Text('Align Text', style: TextStyle(fontSize: 20))
        ));
  }
}
