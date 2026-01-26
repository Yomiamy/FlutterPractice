import 'package:flutter/material.dart';

class ContainerTest1 extends StatefulWidget {
  const ContainerTest1({super.key});

  @override
  State<ContainerTest1> createState() => _ContainerTest1State();
}

class _ContainerTest1State extends State<ContainerTest1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ContainerTest1"),
      ),
      body: Column(
        spacing: 10,
        children: [
          const Text('Container without content'),
          Container(
            color: Colors.amber,
          ),
          const Text('========================================'),
          const Text('Container with content'),
          Container(
            color: Colors.amber,
            child: const Text('ContainerTest1'),
          ),
        ],
      ),
    );
  }
}
