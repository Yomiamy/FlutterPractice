import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_practice/inherited_widget/InheritedAppData.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('InheritedWidgetTest'),
        ),
        body: InheritedAppData(
            countData: 0,
            child: Column(
              children: <Widget>[
                ChildWidget(),
                ElevatedButton(
                    onPressed: () {
                      InheritedAppData.of(context)?.countData += 1;
                    },
                    child: const Text("Increment"))
              ],
            )));
  }
}

class ChildWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 使用 CounterInheritedWidget.of 来获取当前的计数器值
    final int counter = InheritedAppData.of(context)?.countData ?? 0;

    return Center(
      child: Text(
        'Counter: $counter',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
