import 'package:flutter/material.dart';

class InputTypeTextField extends StatelessWidget {
  const InputTypeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('appbarTitle'),
        ),
        body: const Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
            )
          ]
        ));
  }
}
