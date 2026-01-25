import 'package:flutter/material.dart';

class TextFieldTest1 extends StatefulWidget {
  const TextFieldTest1({super.key});

  @override
  State<TextFieldTest1> createState() => _TextFieldTest1State();
}

class _TextFieldTest1State extends State<TextFieldTest1> {

  final TextEditingController _controller = TextEditingController.fromValue(const TextEditingValue(text: "Init Value"));

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      debugPrint("Input: ${_controller.text}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TextFieldTest1"),
        ),
        body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0), // 調整水平邊距以控制長度
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Enter a string',
              ),
              // onChanged: (input) {
              //   debugPrint("Input: $input");
              // },
            ),
          )
      ]
      ),
    );
  }
}