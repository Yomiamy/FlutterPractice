import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/freezed/audio_info.dart';

final cacheOptions = CacheOptions(
  store: MemCacheStore(),
  policy: CachePolicy.request,
  hitCacheOnErrorCodes: [401, 403],
  maxStale: Duration(hours: 1),
  priority: CachePriority.normal,
);

final dio = Dio(
  BaseOptions(
    headers: {
      'Accept': 'application/json',
    },
  ),
)..interceptors.addAll([
    DioCacheInterceptor(options: cacheOptions),
  ]);

class AudioInfoPage extends StatefulWidget {
  const AudioInfoPage({super.key});

  @override
  State<AudioInfoPage> createState() => _AudioInfoPageState();
}

class _AudioInfoPageState extends State<AudioInfoPage> {
  late Future<AudioInfo> _task;

  @override
  void initState() {
    super.initState();
    _task = _fetchAudioData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Audio Info")),
      body: FutureBuilder<AudioInfo>(
        future: _task,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final audioInfoList = snapshot.data?.data ?? [];
          return Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 80, // 給底部的 Refresh 按鈕留出 80 的高度空間，限制 ListView 高度避免崩潰
                child: ListView.builder(
                  itemCount: audioInfoList.length,
                  itemBuilder: (context, index) {
                    final audioItem = audioInfoList[index];
                    return ListTile(
                      title: Text(audioItem.title ?? 'No Title'),
                      subtitle: Text(audioItem.url ?? 'No Summary'),
                    );
                  },
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _task = _fetchAudioData();
                      });
                    },
                    child: const Text('Refresh'),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Future<AudioInfo> _fetchAudioData() async {
    final response = await dio.get(
      'https://www.travel.taipei/open-api/zh-tw/Media/Audio',
    );
    return AudioInfo.fromJson(response.data as Map<String, dynamic>);
  }
}
