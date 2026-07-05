import 'dart:isolate';

import 'package:flutter/material.dart';

class IsolateTest2 extends StatefulWidget {
  const IsolateTest2({super.key});

  @override
  State<IsolateTest2> createState() => _IsolateTest2State();
}

class _IsolateTest2State extends State<IsolateTest2> {
  String? _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Isolate Test2")),
      body: Center(
        child: Column(
          children: [
            Text("Result is ${_result ?? 'No Data'}"),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                Isolate.run(_calculateData).then((data) {
                  setState(() {
                    _result = data;
                  });
                });
              },
              child: const Text("Calculate Data"),
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> _calculateData() async {
  await Future.delayed(const Duration(seconds: 5));
  return "200";
}
