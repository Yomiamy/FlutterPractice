import 'dart:math';

import 'package:flutter/material.dart';

class CurveAnimationTest1 extends StatefulWidget {
  const CurveAnimationTest1({super.key});

  @override
  State<CurveAnimationTest1> createState() => CurveAnimationTest1State();
}

class CurveAnimationTest1State extends State<CurveAnimationTest1>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _sizeAnimation;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();
    _sizeAnimation =
        Tween<double>(begin: 0.0, end: 200.0).animate(_animationController);
    _fadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(_animationController);
    _rotationAnimation =
        Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CurveAnimationTest1'),
      ),
      body: Center(
        child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return FadeTransition(
                opacity: _fadeAnimation,
                child: Transform.rotate(
                  angle: _rotationAnimation.value * 2 * pi,
                  child: Icon(
                    Icons.flutter_dash_sharp,
                    size: _sizeAnimation.value,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
