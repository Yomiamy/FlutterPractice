import 'package:flutter/material.dart';
import 'package:flutter_practice/gen/assets_config.dart';

class Practice168 extends StatefulWidget {
  const Practice168({super.key});

  @override
  State<Practice168> createState() => _Practice168State();
}

class _Practice168State extends State<Practice168> {
  final List<AudioInfo> _audioInfos = [
    AudioInfo(AssetImageRes.icRadio1.imageFile,
        "https://onair.family977.com.tw:8977/live.mp3", "FM 97.7"),
    AudioInfo(AssetImageRes.icRadio2.imageFile,
        "https://onair.bravo913.com.tw:9130/live.mp3 ", "Bravo 91.3"),
    AudioInfo(AssetImageRes.icRadio3.imageFile,
        "https://stream.rcs.revma.com/pntx1639ntzuv.m4a", "News 98"),
    AudioInfo(
        AssetImageRes.icRadio4.imageFile,
        "https://stream.ginnet.cloud/live0130lo-yfyo/_definst_/fm/playlist.m3u8",
        "台北廣播電台 93.1")
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
                debugPrint(audioInfo.description);
              },
              child: ListTile(
                  leading: audioInfo.audioImage,
                  title: Text(audioInfo.description),
                  subtitle: Text(audioInfo.description))
            );
          },
          itemCount: _audioInfos.length,
        ));
  }
}

class AudioInfo {
  final Image audioImage;
  final String audioUrl;
  final String description;

  AudioInfo(this.audioImage, this.audioUrl, this.description);
}
