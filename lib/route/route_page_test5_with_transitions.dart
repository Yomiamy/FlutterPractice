import 'package:flutter/material.dart';

class RoutePageTest5 extends StatelessWidget {
  const RoutePageTest5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RoutePageTest5'),
        ),
        body: TextButton(
          style: TextButton.styleFrom(
            side: const BorderSide(width: 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => const RoutePageTest5ContentPage(),
                transitionsBuilder: (_, animation, ___, child) => FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              ),
            );
          },
          child: const Text('Go Next Page'),
        ));
  }
}

class RoutePageTest5ContentPage extends StatelessWidget {
  const RoutePageTest5ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RoutePageTest5ContentPage'),
        ),
        body: const Center(
          child: Text('RoutePageTest5ContentPage Text'),
        ));
  }
}
