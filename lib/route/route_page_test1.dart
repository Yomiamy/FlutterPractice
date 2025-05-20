import 'package:flutter/material.dart';
import 'package:flutter_practice/route/DataResult.dart';
import 'package:flutter_practice/route/route_page_test2.dart';
import 'package:flutter_practice/route/route_page_with_result_test3.dart';

class RoutePageTest1 extends StatelessWidget {
  const RoutePageTest1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('appbarTitle'),
        ),
        body: const Center(
          child: Text('RoutePageTest1'),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              DataResult result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RoutePageWithResultTest3(),
                      fullscreenDialog: true));

              debugPrint("Route result is: Age = ${result.age}, name = ${result.name}");
            },
            tooltip: 'Go next page',
            child: const Icon(Icons.directions)),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat);
  }
}
