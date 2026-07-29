import 'package:flutter/material.dart';

class SingleChildScrollViewTest1 extends StatefulWidget {
  const SingleChildScrollViewTest1({super.key});

  @override
  State<SingleChildScrollViewTest1> createState() =>
      _SingleChildScrollViewTest1State();
}

class _SingleChildScrollViewTest1State
    extends State<SingleChildScrollViewTest1> {
  @override
  Widget build(BuildContext context) {
    // 'A'..'Z'
    final letters =
        List.generate(26, (index) => String.fromCharCode(65 + index));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
              'SingleChildScrollViewTest1',
              style: TextStyle(fontSize: 30)
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: letters
                    .map((e) => Text(e, style: const TextStyle(fontSize: 28)))
                    .toList(),
              )
          )
        ));
  }
}
