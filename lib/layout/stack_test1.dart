import 'package:flutter/material.dart';

class StackTest1 extends StatelessWidget {
  const StackTest1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('StackTest1'),
        ),
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(child: Container(child: const Text('Hello World3'), color: Colors.blue), bottom: 20),
            Positioned(child: Container(child: const Text('Hello World'), color: Colors.red), top: 18, left: 20),
            Positioned(child: Container(child: const Text('Hello World2'), color: Colors.green), top: 18, right: 20),
          ],
        ));
  }
}
