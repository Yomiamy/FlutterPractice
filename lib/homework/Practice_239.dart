import 'package:flutter/material.dart';
import 'package:flutter_practice/gen/assets_config.dart';
import 'package:flutter_practice/gen/colors.gen.dart';

import '../gen/assets.gen.dart';

class Practice239 extends StatefulWidget {
  const Practice239({super.key});

  @override
  State<Practice239> createState() => _Practice239State();
}

class _Practice239State extends State<Practice239> {
  List<({String history, Image image})> historyList = [
    (
      history: "三隻小豬站在分岔路口揮手告別，分別走向自己的建築地點。背景是一片田野和不同的建築材料堆放點。",
      image: AssetImageRes.threePigPage1.image()
    ),
    (
      history: "第一隻小豬正在堆疊稻草，快速完成了一個簡單的小屋。小豬的表情滿意，背景是金黃色的稻田。",
      image: AssetImageRes.threePigPage2.image()
    ),
    (
      history: "第二隻小豬正在釘木板，建造一個木屋。他拿著一把錘子，背景是綠色森林。",
      image: AssetImageRes.threePigPage3.image()
    ),
    (
      history: "第三隻小豬戴著建築帽，專注地用抹泥刀堆砌磚牆。背景是太陽慢慢下山的田園景色。",
      image: AssetImageRes.threePigPage4.image()
    ),
    (
      history: "大野狼站在稻草房外，露出尖牙。第一隻小豬躲在門後，眼神充滿恐懼。",
      image: AssetImageRes.threePigPage5.image()
    ),
    (
      history: "大野狼用力吹氣，稻草四處飛散。第一隻小豬驚慌地逃跑，背景是散亂的稻草和荒涼的地面。",
      image: AssetImageRes.threePigPage6.image()
    ),
    (
      history: "大野狼再次用力吹氣，木屋倒塌。兩隻小豬一起逃跑，背景是樹枝和木片散落一地。",
      image: AssetImageRes.threePigPage7.image()
    ),
    (
      history: "三隻小豬站在磚頭房子內，透過窗戶偷看大野狼。大野狼氣急敗壞地用力吹氣，但磚牆紋絲不動。",
      image: AssetImageRes.threePigPage8.image()
    ),
    (
      history: "大野狼從煙囪爬下來，被火焰燙到屁股。他跳起來，表情痛苦，三隻小豬在旁邊開心地笑著。",
      image: AssetImageRes.threePigPage9.image()
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Practice239-ThreePigHistory"),
        ),
        body: PageView(
            children: historyList
                .map((record) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(children: [
                      record.image,
                      Text(
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          record.history)
                    ]))
            ).toList()
        )
    );
  }
}
