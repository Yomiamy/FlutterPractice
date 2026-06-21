import 'package:flutter/material.dart';

class ClickInkWell extends StatelessWidget {
  const ClickInkWell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ClickInkWell'),
        ),
        body: InkWell(
            onTap: () {
              // 要有onTap才有水波紋
            },
            child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(color: Colors.blue),
                child: const Text("測試文字"))));
  }
}
