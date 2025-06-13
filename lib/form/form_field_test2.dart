// 此檔案包含一個 Flutter 小工具，示範如何使用 FormField 和 TextFormField。
// 其中包含不同輸入類型的驗證邏輯。

import 'package:flutter/material.dart';

class FormFieldTest2 extends StatefulWidget {
  const FormFieldTest2({super.key});

  @override
  State<FormFieldTest2> createState() => _FormFieldTest2State();
}

class _FormFieldTest2State extends State<FormFieldTest2> {
  final _formKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("FormFieldTest2"),
        ),
        body: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              TextFormField(
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
                  }),
              TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Input Number',
                      hintText: "Please input number"),
                  validator: (str) {
                    if (str == null ||
                        str.isEmpty ||
                        num.tryParse(str) == null) {
                      return "Please input number";
                    }
                    return null;
                  }),
              Builder(builder: (context) {
                return ElevatedButton(
                    onPressed: () {
                      Form.of(context).validate();
                    },
                    child: const Text('Submit')
                );
              })
            ])));
  }
}
