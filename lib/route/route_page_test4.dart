import 'package:flutter/material.dart';

class RoutePageTest4 extends StatelessWidget {
  const RoutePageTest4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RoutePageTest4'),
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
                pageBuilder: (_, __, ___) => const RoutePageTest4ContentPage(),
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

class RoutePageTest4ContentPage extends StatelessWidget {
  const RoutePageTest4ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RoutePageTest4ContentPage'),
        ),
        body: const Center(
          child: Text('RoutePageTest4ContentPage Text'),
        ));
  }
}
