import 'package:flutter/material.dart';

class CursorTextField extends StatelessWidget {
  const CursorTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CursorTextField'),
        ),
        body: const TextField(
          showCursor: true,
          cursorColor: Colors.red,
          cursorWidth: 6,
          cursorRadius: Radius.circular(10),
        ));
  }
}
