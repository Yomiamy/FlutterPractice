import 'package:flutter/material.dart';

class MoveRightTransition extends AnimatedWidget {

  final Widget child;

  const MoveRightTransition({
    super.key,
    required Animation<double> animation,
    required this.child
  }):super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;

    return AnimatedBuilder(
        animation: listenable,
        child: FittedBox(child: child),
        builder: (context, child) {
          return Transform.translate(
              offset: Offset(200 * animation.value, 0),
              child: child
          );
        });
  }}

class AnimationTest2 extends StatefulWidget {
  const AnimationTest2({super.key});

  @override
  State<AnimationTest2> createState() => _AnimationTest2State();
}

class _AnimationTest2State extends State<AnimationTest2> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: 200.0).animate(_animationController);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();

    return Scaffold(
        appBar: AppBar(
          title: const Text('AnimationTest2'),
        ),
        body: MoveRightTransition(
          animation: _animationController,
          child: const Text('DEFECATE'),
        ));
  }
}
