
import 'package:flutter/material.dart';
import 'package:flutter_practice/gen/assets_config.dart';

class Practice218 extends StatefulWidget {
  const Practice218({super.key});

  @override
  State<Practice218> createState() => _Practice218State();
}

class _Practice218State extends State<Practice218> {
  final List<SeasonInfo> _seasonInfoList = [
    SeasonInfo("春", [
      SeasonDetailInfo("https://f.bmcx.com/file/jieqi/jieqi/lichun.jpg",
          "立春，是二十四节气之一，又称“打春”。“立”是“开始”的意思，中国以立春为春季的开始，每年2月4日或5日太阳到达黄经315度时为立春，《月令七十二候集解》：“正月节，立，建始也，立夏秋冬同。"),
      SeasonDetailInfo("https://f.bmcx.com/file/jieqi/jieqi/yushui.jpg",
          "雨水是24节气中的第2个节气。每年的2月19日前后，太阳黄经达330度时，是二十四节气的雨水。此时，气温回升、冰雪融化、降水增多，故取名为雨水。雨水节气一般从2月18日或19日开始，到3月4日或5日结束。雨水和谷雨、小雪、大雪一样，都是反映降水现象的节气。")
    ]),
    SeasonInfo("夏", [
      SeasonDetailInfo("https://f.bmcx.com/file/jieqi/jieqi/lixia.jpg",
          "每年5月5日或5月6日是农历的立夏。“斗指东南，维为立夏，万物至此皆长大，故名立夏也。”此时，太阳黄经为45度，在天文学上，立夏表示即将告别春天，是夏日天的开始。"),
      SeasonDetailInfo("https://f.bmcx.com/file/jieqi/jieqi/xiaoman.jpg",
          "小满是二十四节气之一，夏季的第二个节气。其含义是夏熟作物的籽粒开始灌浆饱满，但还未成熟，只是小满，还未大满。每年5月21日或22日视太阳到达黄径60°时为小满。")
    ]),
    SeasonInfo("秋", [
      SeasonDetailInfo("https://f.bmcx.com/file/jieqi/jieqi/liqiu.jpg",
          "立秋，是二十四节气中的第13个节气，每年8月8日或9日立秋。北斗指向西南。太阳黄经为135°。从这一天起秋天开始，秋高气爽，月明风清。此后，气温由最热逐渐下降。"),
      SeasonDetailInfo("https://f.bmcx.com/file/jieqi/jieqi/yushui.jpg",
          "处暑，二十四节气之一。处暑节气在每年八月二十三日左右。此时太阳到达黄经150°。这时夏季火热已经到头了。暑气就要散了。它是温度下降的一个转折点。是气候变凉的象征，表示暑天终止。")
    ]),
    SeasonInfo("冬", [
      SeasonDetailInfo("https://f.bmcx.com/file/jieqi/jieqi/chushu.jpg",
          "“立冬”节气在每年的11月7日或8日。习惯上，我国人民把这一天当作冬季的开始。冬，作为终了之意，是指一年的田间操作结束了，作物收割之后要收藏起来的意思。立冬一过，我国黄河中、下游地区即将结冰，我国各地农民都将陆续地转入农田水利基本建设和其他农事活动中。"),
      SeasonDetailInfo("https://f.bmcx.com/file/jieqi/jieqi/xiaoxue.jpg",
          "太阳黄经为240°。气温下降，开始降雪，但还不到大雪纷飞的时节，所以叫小雪。小雪前后，黄河流域开始降雪（南方降雪还要晚两个节气）；而北方，已进入封冻季节。")
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _seasonInfoList.length,
        child: Scaffold(
            appBar: AppBar(
                title: const Text("Practice218"),
                bottom: TabBar(
                    tabs: _seasonInfoList
                        .map((seasonInfo) => Tab(
                            icon: const Icon(Icons.access_time),
                            text: seasonInfo.type))
                        .toList())),
            body: TabBarView(
                children: _seasonInfoList
                    .map((seasonInfo) => _buildTabContent(seasonInfo))
                    .toList())));
  }

  Widget _buildTabContent(SeasonInfo seasonInfo) {
    return GridView.builder(
        itemBuilder: (context, index) {
          SeasonDetailInfo detailInfo = seasonInfo.detailInfos[index];
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Practice218Detail(seasonDetailInfo: detailInfo)
                ));
              },
              child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(detailInfo.imgUrl,
                      loadingBuilder: (context, child, progress) {
                    return Column(
                      children: [
                        (progress == null) ? child : AssetImageRes.image.imageFile,
                        Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(detailInfo.description,
                                maxLines: 2, overflow: TextOverflow.ellipsis))
                      ],
                    );
                  })));
        },
        itemCount: seasonInfo.detailInfos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10));
  }
}

class Practice218Detail extends StatelessWidget {
  final SeasonDetailInfo _seasonDetailInfo;

  const Practice218Detail({super.key, required seasonDetailInfo}): _seasonDetailInfo = seasonDetailInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Practice218Detail"),
        ),
        body: Image.network(_seasonDetailInfo.imgUrl,
            loadingBuilder: (context, child, progress) {
              return Column(
                children: [
                  (progress == null) ? child : AssetImageRes.image.imageFile,
                  Padding(
                      padding: const EdgeInsets.all(17),
                      child: Text(
                          _seasonDetailInfo.description,
                        style: const TextStyle(fontSize: 16.0),
                      ))
                ],
              );
            }));
  }
}


class SeasonInfo {
  final String type;
  final List<SeasonDetailInfo> detailInfos;

  SeasonInfo(this.type, this.detailInfos);
}

class SeasonDetailInfo {
  final String imgUrl;
  final String description;

  SeasonDetailInfo(this.imgUrl, this.description);
}
