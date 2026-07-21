import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextTest1 extends StatelessWidget {
  const RichTextTest1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'RichTextTest1',
        style: TextStyle(fontSize: 20),
      )),
      body: RichText(
          text: TextSpan(children: [
        TextSpan(
          text: "Text1",
          style: TextStyle(fontSize: 20, color: Colors.amber),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Text1"),
                ),
              );
            },
        ),
        WidgetSpan(child: SizedBox(width: 10)),
        TextSpan(
          text: "Text2",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          recognizer: TapGestureRecognizer() ..onTap = () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Text2"),
                ),
              );
          },
        ),
        WidgetSpan(child: SizedBox(width: 10)),
        TextSpan(
          text: "Text3",
          style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic),
          recognizer: TapGestureRecognizer()..onTap = () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Text3"),
                ),
              );
          },
        ),
      ])),
    );
  }
}
