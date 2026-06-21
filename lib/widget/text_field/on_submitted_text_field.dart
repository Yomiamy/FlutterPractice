import 'package:flutter/material.dart';

class SubmitTextField extends StatefulWidget {
  const SubmitTextField({super.key});

  @override
  State<SubmitTextField> createState() => _SubmitTextFieldState();
}

class _SubmitTextFieldState extends State<SubmitTextField> {
  String _inputStr = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SubmitTextField'),
        ),
        body: Column(
          children: <Widget>[
            Text(_inputStr),
            TextField(
              onSubmitted: (value) {
                setState(() {
                  _inputStr = value;
                });
              },
            )
          ],
        ));
  }
}
