/*
  檔案名稱：custom_input_form_field.dart
  功能描述：定義一個自訂的輸入表單欄位元件，使用 StatefulWidget 實作。
  主要用途：可在 Flutter 應用中重複使用的自訂表單欄位。
*/
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'custom_input_form_field.dart';
import 'custom_input_form_field2.dart';

class CustomInputFormFieldTest1 extends StatefulWidget {
  const CustomInputFormFieldTest1({super.key});

  @override
  State<CustomInputFormFieldTest1> createState() =>
      _CustomInputFormFieldTest1State();
}

class _CustomInputFormFieldTest1State extends State<CustomInputFormFieldTest1> {
  late TextEditingController _accountController;
  late TextEditingController _passwdController;

  @override
  void initState() {
    super.initState();
    // 初始化 TextEditingController
    _accountController = TextEditingController();
    _passwdController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("CustomInputFormFieldTest1"),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(children: <Widget>[
            const SizedBox(height: 5),
            CustomInputFormField(
                labelText: "請輸入帳號",
                onChanged: (value) {
                  debugPrint("帳號：$value");
                },
                controller: _accountController),
            const SizedBox(height: 20),
            CustomInputFormField(
                labelText: "請輸入密碼",
                isPassword: true,
                onChanged: (value) {
                  debugPrint("密碼：$value");
                },
                controller: _passwdController),
            const SizedBox(height: 20),

            VerificationCodeFormField(
              // // 在 lambda 表示式中標註回傳型態 String?
              // validator: (String? value) {
              //   if (value == null || value.isEmpty) return "cannot be empty";
              //   if (value.isEmpty) return "cannot be empty";
              //   if (value.length < 6) return "You must inform all 6 digits";
              //   return null;
              // },
            ),

            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Toast.show(
                      "帳號: ${_accountController.text}, 密碼: ${_passwdController.text}");
                },
                child: const Text("送出"))
          ])),
    );
  }
}
