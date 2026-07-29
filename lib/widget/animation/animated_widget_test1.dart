import 'package:flutter/material.dart';
import 'package:flutter_practice/bloc/increment_count/state.dart';

class MoveRightTransition extends AnimatedWidget {
  final Widget child;

  const MoveRightTransition({
    super.key,
    required Animation<double> animation,
    required this.child,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return AnimatedBuilder(
      animation: animation,
      child: FittedBox(child: child,),
      builder: (context, child) {
        final x = 200 * animation.value;
        return Transform.translate(offset: Offset(x, 0), child: child);
      },
    );
  }
}

class AnimatedWidgetTest1 extends StatefulWidget {
  const AnimatedWidgetTest1({super.key});

  @override
  State<AnimatedWidgetTest1> createState() => AnimatedWidgetTest1State();
}

class AnimatedWidgetTest1State extends State<AnimatedWidgetTest1>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
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
        title: const Text('AnimatedWidgetTest1'),
      ),
      body: MoveRightTransition(
        animation: _animationController,
        child: const Icon(
          Icons.flutter_dash_sharp,
          size: 200,
        ),
      ),
    );
  }
}
