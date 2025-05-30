import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'take_picture_screen.dart';

class ImagecameraTest extends StatefulWidget {
  const ImagecameraTest({super.key});

  @override
  State<ImagecameraTest> createState() => _ImagecameraTestState();
}

class _ImagecameraTestState extends State<ImagecameraTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ImagecameraTest'),
        ),
        body: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          ElevatedButton(
            onPressed: () {
              pushToCamera(context);
            },
            child: const Text('Open Camera')
          ),

          const Divider(height: 10,
              thickness: 2,
              indent: 5,
              endIndent: 5,
              color: Colors.grey),

          ElevatedButton(
              onPressed: () {},
              child: const Text('Open Album')
          ),
        ]));
  }

  void pushToCamera(BuildContext context) async {
    if(!mounted) {
      return;
    }

    final cameras = await availableCameras();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TakePictureScreen(camera: cameras.first),
      )
    );
  }
}
