import 'package:flutter/material.dart';
import 'package:flutter_practice/gen/assets_config.dart';

class Shadowtexttest1 extends StatefulWidget {
  const Shadowtexttest1({super.key});

  @override
  State<Shadowtexttest1> createState() => _Shadowtexttest1State();
}

class _Shadowtexttest1State extends State<Shadowtexttest1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Shadow Text Test1"),
        ),
        body: const Text(
          "重要的東西是眼睛看不見的",
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [
                Shadow(
                    color: AssetColorRes.black,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 5)
              ]),
        ));
  }
}
