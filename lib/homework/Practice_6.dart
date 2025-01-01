import 'package:flutter/material.dart';
import 'package:flutter_practice/gen/assets_config.dart';

class Practice6 extends StatefulWidget {
  const Practice6({super.key});

  @override
  State<Practice6> createState() => _Practice6State();
}

class _Practice6State extends State<Practice6> {
  List<({String name, String description, Image image})> infoList = [
    (
      name: '伊藤氏原始觀音座蓮',
      description:
          '伊藤氏原始觀音座蓮是台灣特有種植物，屬於蘭科。這種蘭花生長在海拔較高的山區，具有獨特的花形和顏色。它的生長環境通常在潮濕的森林中，是台灣珍貴的原生蘭花之一。',
      image: AssetImageRes.plantPic1.imageFile
    ),
    (
      name: '台灣捲瓣蘭',
      description:
          '台灣捲瓣蘭是台灣特有的蘭科植物，其特徵是花瓣會向後捲曲。這種蘭花通常生長在中低海拔的山區，花期在春季到夏季之間。它們對環境要求較高，需要適當的濕度和遮蔭。',
      image: AssetImageRes.plantPic2.imageFile
    ),
    (
      name: '屏東豆蘭',
      description:
          '屏東豆蘭是台灣特有種，主要分布在屏東地區的低海拔山區。這種蘭花體型小巧，花朵精緻，是台灣本土蘭花中的珍貴物種。它們通常生長在樹幹或岩石上。',
      image: AssetImageRes.plantPic2.imageFile
    ),
    (
      name: '山檳榔',
      description:
          '山檳榔是台灣特有的棕櫚科植物，生長在中低海拔山區。它的外形類似檳榔樹，但體型較小，是台灣原生的珍貴植物之一。這種植物對維持山區生態系統有重要作用。',
      image: AssetImageRes.plantPic3.imageFile
    ),
    (
      name: '桃紅蝴蝶蘭',
      description:
          '桃紅蝴蝶蘭是台灣最著名的蘭花之一，花朵呈現優美的桃紅色。這種蘭花不僅是重要的觀賞植物，也是台灣蘭花產業的重要品種。它們需要較高的空氣濕度和適當的光照。',
      image: AssetImageRes.plantPic4.imageFile
    ),
    (
      name: '台北樹蛙',
      description: '台灣特有種，體型中小型的樹蛙，體色為綠色，具有吸盤可以攀爬樹木。主要分布於北部低海拔山區的闊葉林、竹林與果園中。',
      image: AssetImageRes.animalPic1.imageFile
    ),
    (
      name: '台北樹蛙',
      description: '台灣特有種，體型中小型的樹蛙，體色為綠色，具有吸盤可以攀爬樹木。主要分布於北部低海拔山區的闊葉林、竹林與果園中。',
      image: AssetImageRes.animalPic1.imageFile
    ),
    (
      name: '台灣山椒魚',
      description:
          '台灣特有種兩棲類動物，全長約11-15公分，呈褐色或黑褐色。棲息於海拔1,000公尺以上的山區溪流與森林中，為瀕臨絕種保育類動物。',
      image: AssetImageRes.animalPic2.imageFile
    ),
    (
      name: '台灣獼猴',
      description: '台灣唯一原生猴類，全島皆有分布。屬於中型猴類，具有較短的尾巴，面部略呈紅色。主要棲息於低海拔至中海拔的森林中。',
      image: AssetImageRes.animalPic3.imageFile
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('動植物大觀園', style: TextStyle(color: AssetColorRes.white),),
          backgroundColor: AssetColorRes.green,
        ),
        body: ListView.builder(
          itemCount: infoList.length,
          itemBuilder: (context, index) => getInfoCell(infoList[index].name,
              infoList[index].description, infoList[index].image),
        ));
  }

  Widget getInfoCell(String title, String description, Image image) => Column(
        children: [
          Row(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child: SizedBox(width: 100, height: 100, child: image),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: AssetColorRes.black)),
                    const SizedBox(height: 10,),
                    Text(
                      description,
                      style: const TextStyle(
                          fontSize: 18, color: AssetColorRes.black),
                    )
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 10),
        ],
      );
}
