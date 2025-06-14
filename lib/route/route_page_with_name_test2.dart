import 'package:flutter/material.dart';

class RoutePageWithNameTest2 extends StatefulWidget {

  static const String ROUTE_NAME = "/RoutePageWithNameTest2";

  const RoutePageWithNameTest2({super.key});

  @override
  State<RoutePageWithNameTest2> createState() => _RoutePageWithNameTest2State();
}

class _RoutePageWithNameTest2State extends State<RoutePageWithNameTest2> {
  @override
  Widget build(BuildContext context) {
    // 讀取路由參數
    final arguments = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: const Text("RoutePageWithNameTest2"),
        ),
        body: Column(
        children: <Widget>[
          Text(
              "Data: ${arguments.toString()}",
              style: const TextStyle(fontSize: 22)
          ),

          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Go back')
          )
        ]
      ),
    );
  }
}