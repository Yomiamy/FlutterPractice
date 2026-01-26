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
            Positioned(
                bottom: 300,
                child: Container(color: Colors.blue, child: const Text('Hello World3'))),
            Positioned(
                top: 18,
                left: 20,
                child: Container(color: Colors.red, child: const Text('Hello World'))),
            Positioned(
                top: 18,
                right: 20,
                child: Container(color: Colors.green, child: const Text('Hello World2'))),
          ],
        ));
  }
}
