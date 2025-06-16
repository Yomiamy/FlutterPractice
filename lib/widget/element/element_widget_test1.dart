import 'package:flutter/material.dart';

class ElementWidgetTest1 extends Widget {
  @override
  Element createElement() => ElementTest1(widget: this);
}

class ElementTest1 extends ComponentElement {

  ElementTest1({required Widget widget}) : super(widget);

  String text = "1234567890";

  @override
  Widget build() {
    return Container(
      color: Colors.white,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            text = (text.split("")..shuffle()).join();
            markNeedsBuild();
          },
          child: Text(text)
        )
      ),
    );
  }
}