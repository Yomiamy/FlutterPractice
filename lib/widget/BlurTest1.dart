import 'dart:ui';

import 'package:flutter/material.dart';

class BlurTest1 extends StatefulWidget {
  const BlurTest1({super.key});

  @override
  State<BlurTest1> createState() => _BlurTest1State();
}

class _BlurTest1State extends State<BlurTest1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BlurTest1'),
        ),
        body: Stack(
          children: [
            Image.asset(
              "images/image.jpg"),
            BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                  color: Colors.grey.withOpacity(0.6)
              )
            )
          ]
        ));
  }
}
