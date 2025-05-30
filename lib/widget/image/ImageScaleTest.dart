import 'package:flutter/material.dart';
import 'package:flutter_practice/gen/assets_config.dart';

class ImageScaleTest extends StatelessWidget {
  const ImageScaleTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ImageScaleTest"),
        ),
        body: Container(
            alignment: Alignment.bottomLeft,
            width: 634,
              height: 124,
            color: Colors.black,
            child: AssetImageRes.bgDiceGame.imageFile));
  }
}
