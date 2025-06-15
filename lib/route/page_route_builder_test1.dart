import 'package:flutter/material.dart';
import 'package:flutter_practice/route/route_page_with_name_test1.dart';
import 'package:flutter_practice/route/route_page_with_name_test2.dart';

class PageRouteBuilderTest1 extends StatefulWidget {
  const PageRouteBuilderTest1({super.key});

  @override
  State<PageRouteBuilderTest1> createState() => _PageRouteBuilderTest1State();
}

class _PageRouteBuilderTest1State extends State<PageRouteBuilderTest1> {
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      title: 'PageRouteBuilderTest1',
      routes: {
        RoutePageWithNameTest1.ROUTE_NAME: (context) => const RoutePageWithNameTest1(),
        RoutePageWithNameTest2.ROUTE_NAME: (context) => const RoutePageWithNameTest2()
      },
      // WidgetApp才有pageRouteBuilder
      pageRouteBuilder: <Void>(settings, builder) {
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (context, animation, secondaryAnimation) {
            return builder(context);
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
                position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(animation),
                child: child
            );
          },
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          opaque: true,
          barrierDismissible: false,
          barrierColor: Colors.black54,
          barrierLabel: 'Page Transition',
        );
      },
      color: Colors.blue,
    );
  }
}
