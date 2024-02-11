import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputFormatTextField extends StatelessWidget {
  const TextInputFormatTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TextInputFormatTextField'),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            TextField(
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), LengthLimitingTextInputFormatter(10)],
            )
          ],
        ));
  }
}
