import 'package:flutter/material.dart';

class ColumnSpacerTest1 extends StatelessWidget {
  const ColumnSpacerTest1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ColumnSpacerTest1'),
      ),
      body: const SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            Icon(Icons.add),
            Icon(Icons.minimize),
            Icon(Icons.access_alarm_outlined),
          ],
        ),
      ),
    );
  }
}
