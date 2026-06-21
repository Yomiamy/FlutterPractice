import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputDecorationTextFeild2 extends StatelessWidget {
  const InputDecorationTextFeild2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('InputDecorationTextFeild2'),
        ),
        body: const TextField(
          maxLength: 5,
          maxLengthEnforcement: MaxLengthEnforcement.none,
          enabled: true,
          readOnly: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0)),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2.0)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0))),
        ));
  }
}
