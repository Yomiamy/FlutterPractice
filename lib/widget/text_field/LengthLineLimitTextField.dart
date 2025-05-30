import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LengthLineLimitTextField extends StatelessWidget {
  const LengthLineLimitTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LengthLineLimitTextField'),
        ),
        body: Column(
          children: <Widget>[
            const TextField(maxLength: 5),
            const TextField(maxLength: 5, maxLengthEnforcement: MaxLengthEnforcement.none),
            TextField(inputFormatters: [LengthLimitingTextInputFormatter(5)])
          ]
        ));
  }
}
