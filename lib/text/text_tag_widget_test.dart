import 'package:flutter/material.dart';

class TextTagWidget extends StatefulWidget {
  final String text;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final TextStyle textStyle;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;

  const TextTagWidget({
    super.key,
    this.text = "",
    this.margin = const EdgeInsets.all(4),
    this.padding = const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
    this.textStyle = const TextStyle(),
    this.backgroundColor = Colors.grey,
    this.borderColor = Colors.red,
    this.borderRadius = 4,
  });

  @override
  State<TextTagWidget> createState() => _TextTagWidgetState();
}

class _TextTagWidgetState extends State<TextTagWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(color: widget.borderColor),
      ),
      child: Text(
        widget.text,
        style: widget.textStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class DemoTextTagWidget extends StatelessWidget {
  const DemoTextTagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DemoTextTagWidget")),
      body: Container(
      margin: EdgeInsets.only(top: 20, left: 20),
      width: 250,
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: const [
          TextTagWidget(text: "9折"),
          TextTagWidget(text: "全館", backgroundColor: Colors.white),
          TextTagWidget(
            text: "熱門",
            borderColor: Colors.yellow,
            backgroundColor: Colors.yellow,
          ),
          TextTagWidget(
            text: "推薦",
            borderRadius: 50,
            borderColor: Colors.green,
            backgroundColor: Colors.green,
          ),
          TextTagWidget(
            text: "限時",
            borderRadius: 50,
            borderColor: Colors.red,
            backgroundColor: Colors.red,
          ),
          TextTagWidget(
            text: "2件9折",
            borderColor: Colors.blue,
            backgroundColor: Colors.blue,
          ),
          TextTagWidget(
            text: "限時",
            borderColor: Colors.red,
            backgroundColor: Colors.red,
          ),
          TextTagWidget(
            text: "買一送一",
            borderColor: Colors.red,
            backgroundColor: Colors.red,
          ),        
        ],
      ),
    ),
    );
  }
}
