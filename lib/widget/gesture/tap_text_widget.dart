import 'package:flutter/material.dart';

class TapTextWidget extends StatelessWidget {
  const TapTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('增加點擊'),
        ),
        body: Column(children: <Widget>[
          GestureDetector(
              onTap: () {
                debugPrint("GestureDetector onTap");
              },
              child: const Text(
                  "文字按鈕ㄧ",
                  style: TextStyle(
                      fontSize: 30
                  )
              )
          ),
          const Divider(
              height: 30,
              color: Colors.transparent,
          ),
          InkWell(
              child: const Text(
                  "文字按鈕二",
                  style: TextStyle(
                    fontSize: 30
                  )
              ),
              onTap: () {
                debugPrint("InkWell onTap");
              })
        ]));
  }
}
