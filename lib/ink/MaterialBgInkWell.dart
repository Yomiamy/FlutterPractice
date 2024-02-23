import 'package:flutter/material.dart';

class MaterialBgInkWell extends StatelessWidget {
  const MaterialBgInkWell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MaterialBgInkWell'),
        ),
        body: Material(
            // TODO: 到此
            // color: Colors.purple,
            type: MaterialType.card,
            shadowColor: Colors.blue,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                side: BorderSide(width: 1, color: Colors.black)),
            // borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            elevation: 12,
            child: InkWell(
                onTap: () {
                  debugPrint("on Tap InkWell");
                },
                child: Container(
                    width: 300.0,
                    height: 50.0,
                    alignment: const Alignment(0, 0),
                    child: const Text(
                      '登陸',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    )))));
  }
}
