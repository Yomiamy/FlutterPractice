import 'package:flutter/material.dart';

class FadeTrasitionTest1 extends StatefulWidget {
  const FadeTrasitionTest1({super.key});

  @override
  State<FadeTrasitionTest1> createState() => _FadeTrasitionTest1State();
}

class _FadeTrasitionTest1State extends State<FadeTrasitionTest1> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('OpacityAnimationTest1'),
        ),
        body: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Opacity(
                opacity: _animationController.value,
                child: const Text(
                    "ABCDEFG",
                  style: TextStyle(fontSize: 40),
                )
              );
            }
        )
    );
  }
}
