import 'package:flutter/material.dart';

class PageRouteBuilderTest2 extends StatefulWidget {
  const PageRouteBuilderTest2({super.key});

  @override
  State<PageRouteBuilderTest2> createState() => _PageRouteBuilderTest2State();
}

class _PageRouteBuilderTest2State extends State<PageRouteBuilderTest2> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('PageRouteBuilderTest2')),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      Scaffold(
                    appBar: AppBar(title: Text('Page 2')),
                    body: Text('Page 2'),
                  ),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: Tween<double>(begin: 0, end: 1).animate(animation),
                      child: child,
                    );
                  },
                ),
              );
            },
            child: Text('Go another page'),
          ),
        ),
      );
}
