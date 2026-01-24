import 'package:flutter/material.dart';

class ConstrainedBoxTest1 extends StatefulWidget {
  const ConstrainedBoxTest1({super.key});

  @override
  State<ConstrainedBoxTest1> createState() => _ConstrainedBoxTest1State();
}

class _ConstrainedBoxTest1State extends State<ConstrainedBoxTest1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ConstrainedBoxTest1e"),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 100,
          maxHeight: 200,
          minWidth: 100,
          maxWidth: 200,
        ),
        child: Container(
          color: Colors.amber,
        ),
      ),
    );
  }
}
