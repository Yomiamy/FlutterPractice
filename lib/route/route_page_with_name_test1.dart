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
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
              color: Colors.blue,
              alignment: Alignment.center,
              child: const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text("RoutePageWithNameTest1", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
              )
          )),
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
