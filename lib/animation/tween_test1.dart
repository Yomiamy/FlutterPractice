import 'package:flutter/material.dart';

class TypingTween extends Tween<String> {
  TypingTween({super.begin = '', super.end});

  @override
  String lerp(double t) {
    final len = end?.length ?? 0;
    final curPos = (len * t).round();
    return end?.substring(0, curPos) ?? '';
  }
}

class TweenTest1 extends StatefulWidget {
  const TweenTest1({super.key});

  @override
  State<TweenTest1> createState() => TweenTest1State();
}

class TweenTest1State extends State<TweenTest1>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<String> _typingAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    _typingAnimation = TypingTween(
      begin: '',
      end: 'D/FlutterJNI(10110): flutter (null) was loaded normally!',
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
        title: const Text('TweenTest1'),
      ),
      body: AnimatedBuilder(
          animation: _typingAnimation, builder: (ctx, child) {
            return Text(_typingAnimation.value, style: const TextStyle(fontSize: 24));
          }),
    );
  }
}
