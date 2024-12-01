import 'package:flutter/material.dart';

class BorderTest1 extends StatefulWidget {
  const BorderTest1({super.key});

  @override
  State<BorderTest1> createState() => _BorderTest1State();
}

class _BorderTest1State extends State<BorderTest1> {
  static const SizedBox DIVIDER = SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BorderTest1"),
        ),
        body: Column(
          children: [
            // OutlinedButton
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    side: const BorderSide(width: 5, color: Colors.orange)),
                onPressed: () {},
                child: const Text('Outline Button')),

            DIVIDER,

            // TextField
            const Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                    decoration: InputDecoration(
                        hintText: "name",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))))),

            DIVIDER,

            Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red, width: 4)

                    // border: Border(
                    //   top: BorderSide(width: 3.0, color: Colors.red),    // 上邊框
                    //   left: BorderSide(width: 5.0, color: Colors.green), // 左邊框
                    //   right: BorderSide(width: 2.0, color: Colors.blue), // 右邊框
                    //   bottom: BorderSide(width: 4.0, color: Colors.yellow), // 下邊框
                    // ),
                    // borderRadius: BorderRadius.circular(10)
                    ),
                width: 150,
                height: 150,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text("SWIFT UI"))
          ],
        ));
  }
}
