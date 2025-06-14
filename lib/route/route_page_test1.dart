import 'package:flutter/material.dart';
import 'package:flutter_practice/route/DataResult.dart';
import 'package:flutter_practice/route/route_page_with_result_test1.dart';

class RoutePageTest1 extends StatelessWidget {
  const RoutePageTest1({super.key});

  @override
  Widget build(BuildContext context) {
    const String flavorConfig = String.fromEnvironment('FLAVOR', defaultValue: 'None');
    return Scaffold(
        appBar: AppBar(
          title: const Text("RoutePageTest1-$flavorConfig"),
        ),
        body: const Center(
          child: Text(
              'RoutePageTest1-$flavorConfig',
               style: TextStyle(fontSize: 30),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              DataResult result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RoutePageWithResultTest1(),
                      fullscreenDialog: true));

              debugPrint("Route result is: Age = ${result.age}, name = ${result.name}");
            },
            tooltip: 'Go next page',
            child: const Icon(Icons.directions)),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat);
  }
}
