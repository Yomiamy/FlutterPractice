import 'package:flutter/material.dart';

class InputDecorationTextFeild extends StatelessWidget {
  const InputDecorationTextFeild({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('InputDecorationTextFeild'),
        ),
        body: const Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none
              )
            ),
            TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                )
            )
          ],
        ));
  }
}
