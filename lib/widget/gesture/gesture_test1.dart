 /*
 * 檔案：/Users/runner/work/aspire-app/aspire-app/lib/gesture/gesture_test1.dart
 * 功能：這是一個 Flutter Widget，用於展示手勢偵測功能。它包含一個計數器，用於追蹤單擊和雙擊事件的次數。
 * 作者：[你的名字或團隊名稱]
 */

import 'package:flutter/material.dart';

class GestureTest1 extends StatefulWidget {
  const GestureTest1({super.key});

  @override
  State<GestureTest1> createState() => _GestureTest1State();
}

class _GestureTest1State extends State<GestureTest1> {
  int _count = 0;
  int _doubleCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("GestureTest1"),
        ),
        body: GestureDetector(
            child: Container(
              child: Center(
                  child: Text(
                """
              Tap Count: $_count
              Double Tab Count: $_doubleCount
              """,
                style: const TextStyle(fontSize: 22),
              )),
            ),
            onTap: () {
              setState(() {
                _count++;
              });
            },
            onDoubleTap: () {
              setState(() {
                _doubleCount++;
              });
            }));
  }
}
