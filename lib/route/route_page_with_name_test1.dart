import 'package:flutter/material.dart';
import 'route_page_with_name_test2.dart';

class RoutePageWithNameTest1 extends StatefulWidget {

  static const String ROUTE_NAME = "/";

  const RoutePageWithNameTest1({super.key});

  @override
  State<RoutePageWithNameTest1> createState() => _RoutePageWithNameTest1State();
}

class _RoutePageWithNameTest1State extends State<RoutePageWithNameTest1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RoutePageWithNameTest1"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text("RoutePageWithNameTest1", style: TextStyle(fontSize: 22)),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                    RoutePageWithNameTest2.ROUTE_NAME,
                    arguments: "From RoutePageWithNameTest1"
                );
              },
              child: const Text('Go to RoutePageWithNameTest2'),
            )
          ],
        ),
      ),
    );
  }
}
