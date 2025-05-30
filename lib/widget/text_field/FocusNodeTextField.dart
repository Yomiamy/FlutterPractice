import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FocusNodeTextField extends StatefulWidget {
  const FocusNodeTextField({super.key});

  @override
  State<FocusNodeTextField> createState() => _FocusNodeTextFieldState();
}

class _FocusNodeTextFieldState extends State<FocusNodeTextField> {

  String _inputStr = "";
  FocusNode _userNameFocusNode = FocusNode();
  FocusNode _passwdFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FocusNodeTextField'),
        ),
        body: GestureDetector(
          onTap: () {
            _hideKeyboard();
          },
          child: Center(child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                    children: <Widget>[
                      const Text("Name:"),
                      const SizedBox(width: 12),
                      Expanded(child: TextField(
                          focusNode: _userNameFocusNode,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          onSubmitted: (value) {
                            setState(() {
                              _inputStr = value;
                              // 取消焦點
                              _userNameFocusNode.unfocus();
                              // 要求下一個輸入的焦點
                              FocusScope.of(context).requestFocus(_passwdFocusNode);
                            });
                          }
                      ))
                    ]
                ),

                const SizedBox(height: 30),

                Row(
                    children: <Widget>[
                      const Text("Password:"),
                      const SizedBox(width: 12),
                      Expanded(child: TextField(
                          focusNode: _passwdFocusNode,
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          onSubmitted: (value) {
                            setState(() {
                              _inputStr = value;

                              print("onSubmit password: $value");
                            });
                          }
                      ))
                    ]
                )
              ]
          ))
        )
    );
  }

  void _hideKeyboard() {
    SystemChannels.textInput.invokeMethod("TextInput.hide");
  }

  @override
  void dispose() {
    _passwdFocusNode.dispose();
    _userNameFocusNode.dispose();
    super.dispose();
  }
}
