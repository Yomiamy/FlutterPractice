import 'package:flutter/material.dart';

import 'route_page_with_name_test1.dart';
import 'route_page_with_name_test2.dart';

class RoutePageWithNamingRouteTest1 extends StatelessWidget {

  const RoutePageWithNamingRouteTest1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        RoutePageWithNameTest1.ROUTE_NAME : (context) => const RoutePageWithNameTest1(),
        RoutePageWithNameTest2.ROUTE_NAME : (context) => const RoutePageWithNameTest2()
      }
    );
  }
}
