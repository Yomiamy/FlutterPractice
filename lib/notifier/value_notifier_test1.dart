import 'package:flutter/material.dart';

class ValueNotifierTest1 extends StatelessWidget {
  final counter = ValueNotifier<int>(0);

  ValueNotifierTest1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueNotifierTest1'),
      ),
      body: ValueListenableBuilder(
          valueListenable: counter,
          builder: (ctx, value, child) {
            return Column(
              children: [
                Text('value = ${counter.value}'),
                TextButton(
                  onPressed: () {
                    counter.value++;
                  },
                  child: const Text('Increment'),
                )
              ],
            );
          }),
    );
  }
}
