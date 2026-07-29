/*
 * 此檔案定義了兩個自訂 Flutter 小工具：
 *
 * 1. `VerificationCodeInput`：一個專門用於輸入驗證碼的 `TextField`。
 *    它強制要求輸入數字，且最大長度為 6 個字元。
 * 2. `VerificationCodeFormField`：一個包裝了 `VerificationCodeInput` 的 `FormField`，
 *    使其可以輕鬆地整合到 Flutter 表單中，以進行驗證和資料處理。
 */

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class VerificationCodeInput extends StatefulWidget {
  final BorderSide borderSide;
  final onChanged;
  final controller;

  const VerificationCodeInput({
    super.key,
    this.controller,
    this.borderSide = const BorderSide(),
    this.onChanged,
  });

  @override
  _VerificationCodeInputState createState() => _VerificationCodeInputState();
}

class _VerificationCodeInputState extends State<VerificationCodeInput> {

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        LengthLimitingTextInputFormatter(6),
      ],
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: widget.borderSide,
        ),
      ),
      keyboardType: TextInputType.number,
      onChanged: widget.onChanged,
    );
  }
}

/// FormField version of the VerificationCodeInput widget
class VerificationCodeFormField extends FormField<String> {
  VerificationCodeFormField({
    super.key,
    super.onSaved,
    super.validator,
  }) : super(
          builder: (FormFieldState<String> field) {
            final _VerificationCodeFormFieldState state =
                field as _VerificationCodeFormFieldState;
            return VerificationCodeInput(
              controller: state._controller
            );
          },
        );

  @override
  FormFieldState<String> createState() => _VerificationCodeFormFieldState();
}

class _VerificationCodeFormFieldState extends FormFieldState<String> {
  final TextEditingController _controller = TextEditingController(text: "");

  @override
  void reset() {
    super.reset();
    _controller.text = "";
    _controllerChanged();
  }

  void _controllerChanged() {
    didChange(_controller.text);
  }
}