import 'package:flutter/material.dart';

class LabelTextTextField extends StatelessWidget {
  const LabelTextTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LabelTextTextField'),
        ),
        body: Container(
          margin: const EdgeInsets.all(30.0),
          child: const Column(children: <Widget>[
            TextField(
                decoration: InputDecoration(
                    labelText: 'UserName',
                  hintText: 'UserName',
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))
                ))),

            SizedBox(height: 10),

            TextField(
                decoration: InputDecoration(
                    labelText: 'Passwd',
                    hintText: 'Passwd',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))
                    )))
          ]),
        ));
  }
}
