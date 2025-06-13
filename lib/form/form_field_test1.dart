import 'package:flutter/material.dart';

class FormFieldTest1 extends StatefulWidget {
  const FormFieldTest1({super.key});

  @override
  State<FormFieldTest1> createState() => _FormFieldTest1State();
}

class _FormFieldTest1State extends State<FormFieldTest1> {
  final GlobalKey<FormFieldState<String>> _formFieldKey =
  GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FormFieldTest1"),
      ),
      body: Column(children: <Widget>[
        TextFormField(
            key: _formFieldKey,
            decoration: const InputDecoration(
                labelText: 'Input Data',
                hintText: "Please input string or number"),
            validator: (str) {
              if (str == null || str.isEmpty) {
                return "Please input data";
              }
              if (num.tryParse(str) == null && str.length < 5) {
                return "String length must be >= 5";
              }
              return null;
            }
        ),

        ElevatedButton(
            onPressed: () {
              _formFieldKey.currentState?.validate();
            },
            child: const Text('Submit')
        )
      ]),
    );
  }
}
