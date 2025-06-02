import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CounterModel.dart';

class ProviderTest1 extends StatefulWidget {
  const ProviderTest1({super.key});

  @override
  State<ProviderTest1> createState() => _ProviderTest1State();
}

class _ProviderTest1State extends State<ProviderTest1> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CounterModel(),
        // Replace `YourNotifier` with your actual ChangeNotifier class
        child: Scaffold(
            appBar: AppBar(
              title: const Text("ProviderTest1"),
            ),
            body: Builder(builder: (context) {
              // Provider.of<CounterModel>(context, listen: true);
              final counterModel = context.watch<CounterModel>();

              return Column(children: <Widget>[
                Text("Count: ${counterModel.count}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ElevatedButton(
                    onPressed: () {
                      counterModel.increment();
                    },
                    child: const Text("Increment"))
              ]);
            }
            )
        )
    );
  }
}
