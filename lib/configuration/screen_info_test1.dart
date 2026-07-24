import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:path/path.dart';

class ScreenInfoTest1 extends StatelessWidget {
  const ScreenInfoTest1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen Info Test 1')),
      body: Center(
        child: Column(
          children: [
            Text('Logical Screen Width: ${MediaQuery.of(context).size.width}'),
            Text('Logical Screen Height: ${MediaQuery.of(context).size.height}'),
            Text('Device Pixel Ratio: ${MediaQuery.of(context).devicePixelRatio}'),
            Text('Physical Width: ${MediaQuery.of(context).size.width * MediaQuery.of(context).devicePixelRatio}'),
            Text('Physical Height: ${MediaQuery.of(context).size.height * MediaQuery.of(context).devicePixelRatio}'),
            Text('Physical Screen Height: ${window.physicalSize.height}'),
            Text('Physical Screen Width: ${window.physicalSize.width}'),

          ],
        ),
      ),
    );
  }
}