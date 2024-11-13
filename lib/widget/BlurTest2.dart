import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_practice/gen/assets.gen.dart';
import 'package:flutter_practice/gen/colors.gen.dart';

class BlurTest2 extends StatefulWidget {
  const BlurTest2({super.key});

  @override
  State<BlurTest2> createState() => _BlurTest2State();
}

class _BlurTest2State extends State<BlurTest2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BlurTest1'),
        ),
        body: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Assets.images.image.image()
        ));
  }
}
