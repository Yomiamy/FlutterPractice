import 'package:flutter/material.dart';
import 'package:flutter_practice/route/DataResult.dart';

class RoutePageWithResultTest3 extends StatelessWidget {
  const RoutePageWithResultTest3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RoutePageTest2'),
        ),
        body: const Center(
          child: Text('RoutePageTest2'),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              DataResult result = DataResult(age: 10, name: "Jerry");
              Navigator.pop(context, result);
            },
            tooltip: 'Go back page',
            child: const Icon(Icons.arrow_back)),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat);
  }
}
