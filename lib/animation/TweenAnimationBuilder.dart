import 'package:flutter/material.dart';

class AnimationTest3 extends StatefulWidget {
  const AnimationTest3({super.key});

  @override
  State<AnimationTest3> createState() => _AnimationTest3State();
}

class _AnimationTest3State extends State<AnimationTest3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AnimationTest3'),
        ),
        body: TweenAnimationBuilder(
            tween: ColorTween(begin: Colors.blue, end: Colors.green),
            duration: const Duration(seconds: 2),
            curve: Curves.bounceInOut,
            builder: (context, tween, child) {
              // 移除parent的填滿整個螢幕的constraint
              return UnconstrainedBox(child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(color: tween, borderRadius: BorderRadius.circular(20.0)),
                child: Text("ABCDEFG"),
              ));
            })
    );
  }
}
