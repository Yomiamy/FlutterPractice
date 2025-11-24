import 'package:flutter/material.dart';

class RoutePageTest6 extends StatelessWidget {
  const RoutePageTest6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RoutePageTest6'),
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
                pageBuilder: (_, __, ___) => const RoutePageTest6ContentPage(),
                transitionsBuilder: (_, animation, ___, child) {
                  const begin = 0.0;
                  const end = 1.0;
                  const curve = Curves.easeIn;

                  final tweenAnim = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve))
                      .animate(animation);

                  return AnimatedBuilder(
                      animation: tweenAnim,
                      builder: (context, child) {
                        final rotateY = tweenAnim.value * 3.14;
                        return Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(rotateY),
                          alignment: Alignment.center,
                          child: child,
                        );
                      });
                },
              ),
            );
          },
          child: const Text('Go Next Page'),
        ));
  }
}

class RoutePageTest6ContentPage extends StatelessWidget {
  const RoutePageTest6ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RoutePageTest6ContentPage'),
        ),
        body: const Center(
          child: Text('RoutePageTest6ContentPage Text'),
        ));
  }
}
