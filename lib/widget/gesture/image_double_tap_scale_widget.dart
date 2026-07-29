import 'package:flutter/material.dart';

class ImageDoubleTapScaleWidget extends StatefulWidget {
  const ImageDoubleTapScaleWidget({super.key});

  @override
  State<ImageDoubleTapScaleWidget> createState() => _ImageDoubleTapScaleWidgetState();
}

class _ImageDoubleTapScaleWidgetState extends State<ImageDoubleTapScaleWidget> {

  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('雙擊圖片放大'),
        ),
        body: GestureDetector(
          child: Container(
            width: 160,
            height: 160,
            transform: Matrix4.identity().scaled(_scale, _scale),
            child: Image.asset("images/image.jpg", fit: BoxFit.fill)
          ),
          onDoubleTap: () {
            setState(() {
              _scale = _scale == 1.0 ? 2.0 : 1.0;
            });
          },
        ));
  }
}
