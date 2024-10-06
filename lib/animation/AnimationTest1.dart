import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_practice/animation/TypingTween.dart';

class Animationtest1 extends StatefulWidget {
  const Animationtest1({super.key});

  @override
  State<Animationtest1> createState() => _Animationtest1State();
}

class _Animationtest1State extends State<Animationtest1> with SingleTickerProviderStateMixin {

  late AnimationController _anaimationController;
  late Animation _animation1;
  late Animation _animation2;
  late Animation _animation3;
  late Animation _animation4;
  late Animation _animation5;

  @override
  void initState() {
    super.initState();

    _anaimationController = AnimationController(vsync: this,  duration: const Duration(seconds: 2));

    // _animation1 = _anaimationController.drive(Tween<Offset>(
    //     begin: const Offset(0.0, 0.0),
    //     end: const Offset(100, 200))
    // );

    // _animation2 = Tween<Offset>(
    //     begin: const Offset(0.0, 0.0),
    //     end: const Offset(100.0, 200.0)
    // ).animate(_anaimationController);

    // _animation3 = Tween(begin: 0.0, end: 20.0)
    //     .chain(CurveTween(curve: Curves.easeIn))
    //     .animate(_anaimationController);

    _animation3 = TypeTween(begin: "", end: "ABCDEFGHIJKL")
        .chain(CurveTween(curve: Curves.easeIn))
        .animate(_anaimationController);

    // _animation4 = CurvedAnimation(parent: _anaimationController, curve: Curves.easeInOut);

    // _animation5 = CurvedAnimation(
    //     parent: _anaimationController,
    //     curve: const Interval(0, .6, curve: Curves.fastOutSlowIn));
  }

  @override
  void dispose() {
    _anaimationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _anaimationController.forward();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Animationtest1'),
        ),
        body: AnimatedBuilder(
            animation: _anaimationController,
            builder: (context, _) {
              return Container(
                child: Text( _animation3.value)
              );
            }
        )
    );
  }
}
