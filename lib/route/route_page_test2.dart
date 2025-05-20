import 'package:flutter/material.dart';

class RoutePageTest2 extends StatelessWidget {
  const RoutePageTest2({super.key});

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
              Navigator.pop(context);
            },
            tooltip: 'Go back page',
            child: const Icon(Icons.arrow_back)),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat);
  }
}
