import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}

class ChangeNotifierTest1 extends StatefulWidget {
  const ChangeNotifierTest1({super.key});

  @override
  State<ChangeNotifierTest1> createState() => _ChangeNotifierTest1State();
}

class _ChangeNotifierTest1State extends State<ChangeNotifierTest1> {
  final counterModel = CounterModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ChangeNotifierTest1"),
        ),
        body: ListenableBuilder(
            listenable: counterModel,
            builder: (_, child) {
              return Column(children: <Widget>[
                Text(
                  'Current value is ${counterModel.count}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                    onPressed: () => counterModel.increment(), child: const Text('Increment')),
                ElevatedButton(
                  onPressed: () => counterModel.decrement(),
                  child: const Text('Decrement'),
                ),
                ElevatedButton(
                  onPressed: () => counterModel.reset(),
                  child: const Text('Reset'),
                )
              ]);
            }));
  }
}
