/*
  檔案名稱：custom_input_form_field.dart
  功能描述：定義一個自訂的輸入表單欄位元件，使用 StatefulWidget 實作。
  主要用途：可在 Flutter 應用中重複使用的自訂表單欄位。
*/
import 'package:flutter/material.dart';

class CustomInputFormField extends StatefulWidget {
  final ValueChanged<String> _onChanged;
  final TextEditingController _controller;
  final String _labelText;
  final bool _isPassword;

  const CustomInputFormField(
      {super.key,
      required String labelText,
      required ValueChanged<String> onChanged,
      required TextEditingController controller,
        bool isPassword = false})
      : _labelText = labelText,
        _onChanged = onChanged,
        _controller = controller,
        _isPassword = isPassword;

  @override
  State<CustomInputFormField> createState() => _CustomInputFormFieldState();
}

class _CustomInputFormFieldState extends State<CustomInputFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget._controller,
      obscureText: widget._isPassword, // 如果 widget._isPassword 為 true，則隱藏輸入內容
      decoration: InputDecoration(
        labelText: widget._labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(width: 1.0)
        ),
      ),
      onChanged: widget._onChanged,
    );
  }
}
