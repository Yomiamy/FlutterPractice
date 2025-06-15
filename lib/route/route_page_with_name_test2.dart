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
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text("RoutePageWithNameTest2", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
            )
          )),
      body: Column(children: <Widget>[
        Text("Data: ${arguments.toString()}", style: const TextStyle(fontSize: 22)),
        const SizedBox(height: 10),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Go back'))
      ]),
    );
  }
}
