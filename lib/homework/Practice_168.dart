import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/gen/assets_config.dart';

class Practice168 extends StatefulWidget {
  const Practice168({super.key});

  @override
  State<Practice168> createState() => _Practice168State();
}

class _Practice168State extends State<Practice168> {
  final List<AudioInfo> _audioInfos = [
    AudioInfo(
        AssetImageRes.icRadio1.imageFile,
        "https://onair.family977.com.tw:8977/live.mp3",
        "FM 97.7\n在台北地區，FM 97.7由台灣聲音廣播電台播出，成立於2005年，主要服務基隆市、台北市和新北市。該電台以24小時播放精選的台語老歌、國語老歌和懷舊日本老歌為特色，深受聽眾喜愛，迅速建立了忠實的聽眾群。"),
    AudioInfo(AssetImageRes.icRadio2.imageFile,
        "http://fm901.cityfm.tw:8080/901.mp3 ",
        "Bravo 91.3\nBravo FM91.3（台北都會音樂台）於2009年3月開播，是台北地區的音樂廣播電台，主要播放古典音樂、爵士樂等多元音樂類型，並提供藝文資訊，致力於提升聽眾的音樂素養和生活品味。該電台與好家庭廣播FM97.7合作，組成「好家庭聯播網」，共同推廣優質音樂與文化內容。"),
    AudioInfo(AssetImageRes.icRadio3.imageFile,
        "http://stream.pbs.gov.tw:1935/live/TPS/playlist.m3u8",
        "警察廣播電臺（簡稱警廣）是中華民國的國營廣播電臺，隸屬於內政部警政署，成立於1954年3月1日，是全國首個公營全區廣播電臺"),
    AudioInfo(
        AssetImageRes.icRadio4.imageFile,
        "https://stream.ginnet.cloud/live0130lo-yfyo/_definst_/fm/playlist.m3u8",
        "台北廣播電台 93.1\n台北廣播電台成立於1961年，隸屬於台北市政府觀光傳播局，擁有FM 93.1與AM 1134雙頻率。電台關注在地人文與社會福利議題，提供多元節目，服務台北市民。")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Practice168"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            AudioInfo audioInfo = _audioInfos[index];

            return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AudioDetail(audioInfo: audioInfo)));
                },
                child: Column(
                children: <Widget>[
                  ListTile(
                      leading: audioInfo.audioImage,
                      title: Text(audioInfo.description)),
                  const Divider(height: 2, color: Colors.grey)
                ]
              )
            );
          },
          itemCount: _audioInfos.length,
        ));
  }
}

class AudioDetail extends StatefulWidget {
  final AudioInfo _audioInfo;

  const AudioDetail({super.key, required AudioInfo audioInfo})
      : _audioInfo = audioInfo;

  @override
  State<AudioDetail> createState() => _AudioDetailState();
}

class _AudioDetailState extends State<AudioDetail> {

  late AudioPlayer _player;

  @override
  void initState() {
    super.initState();

    _player = AudioPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    _player.dispose();
  }

  _playAudio() async {
    await _player.play(UrlSource(widget._audioInfo.audioUrl), mode: PlayerMode.mediaPlayer);
  }

  @override
  Widget build(BuildContext context) {
    _playAudio();

    return Scaffold(
        appBar: AppBar(
          title: const Text("AudioDetail"),
        ),
        body: Column(children: <Widget>[
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            Expanded(flex: 1, child: widget._audioInfo.audioImage),
            const SizedBox(width: 10),
            Expanded(
                flex: 1,
                child: Text(
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    widget._audioInfo.description))
          ]),
        ]));
  }
}

class AudioInfo {
  final Image audioImage;
  final String audioUrl;
  final String description;

  AudioInfo(this.audioImage, this.audioUrl, this.description);
}
