import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimationTest2 extends StatefulWidget {
  const AnimationTest2({super.key});

  @override
  State<AnimationTest2> createState() => AnimationTest2State();
}

class AnimationTest2State extends State<AnimationTest2>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();
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
        title: const Text('Explicit Animation'),
      ),
      body: AnimatedBuilder(
          animation: _animationController, builder: (context, child) {
            final size = 200 * _animationController.value;
            return Center(
              child: Icon(
                Icons.flutter_dash,
                size: size,
                color: Colors.blue,
              ),
            );
          }),
    );
  }
}
