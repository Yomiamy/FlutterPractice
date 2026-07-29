import 'package:flutter/material.dart';

class SlideAnimationTest1 extends StatefulWidget {
  const SlideAnimationTest1({super.key});

  @override
  State<SlideAnimationTest1> createState() => _SlideAnimationTest1State();
}

class _SlideAnimationTest1State extends State<SlideAnimationTest1>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Alignment> _alignAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    _alignAnimation = AlignmentTween(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explicit Animation 3'),
      ),
      body: Column(
        children: [
          Expanded(
            child: AlignTransition(
              alignment: _alignAnimation,
              child: const Icon(
                Icons.airplanemode_active,
                size: 50,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _controller.forward();
                  },
                  child: const Text('Forward'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    _controller.reverse();
                  },
                  child: const Text('Reverse'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
