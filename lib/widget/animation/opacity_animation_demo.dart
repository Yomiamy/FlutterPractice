import 'package:flutter/material.dart';

class OpacityAnimationTest1 extends StatefulWidget {
  const OpacityAnimationTest1({super.key});

  @override
  State<OpacityAnimationTest1> createState() => _OpacityAnimationTest1State();
}

class _OpacityAnimationTest1State extends State<OpacityAnimationTest1> with SingleTickerProviderStateMixin {

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
