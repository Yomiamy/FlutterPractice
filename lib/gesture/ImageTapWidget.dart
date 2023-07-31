import 'package:flutter/material.dart';

class ImageTapWidget extends StatelessWidget {
  const ImageTapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('圖片點擊'),
        ),
        body: GestureDetector(
          child: Container(
            width: 200,
            height: 200,
            child: Image.asset("images/image.jpg")
          ),
          onTap: () {
            debugPrint("Image clicked...");
          }
        ));
  }
}
