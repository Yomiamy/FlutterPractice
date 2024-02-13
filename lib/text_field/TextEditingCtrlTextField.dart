import 'package:flutter/material.dart';

class TextEditingCtrlTextField extends StatefulWidget {
  const TextEditingCtrlTextField({super.key});

  @override
  State<TextEditingCtrlTextField> createState() => _TextEditingCtrlTextFieldState();
}

class _TextEditingCtrlTextFieldState extends State<TextEditingCtrlTextField> {

  TextEditingController _editingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _editingController.addListener(() {
      String currentStr = _editingController.text;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('TextEditingCtrlTextField'),
        ),
        body: TextField(

        ));
  }

  String _getEditingText() => _editingController.text;

  void setEditingText(String text) { _editingController.text = text; }

  void clearEditingText() { _editingController.clear(); }

  void setInputTextAndSelection(String text) {
    _editingController = TextEditingController.fromValue(
      TextEditingValue(
        text: text,
        selection: TextSelection.fromPosition(
          TextPosition(
            affinity: TextAffinity.downstream,
            offset: text.length
          )
        )
      )
    );
  }


}
