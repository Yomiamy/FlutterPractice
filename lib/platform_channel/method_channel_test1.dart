import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelTest1 extends StatefulWidget {
  const MethodChannelTest1({super.key});

  @override
  State<MethodChannelTest1> createState() => _MethodChannelTest1State();
}

class _MethodChannelTest1State extends State<MethodChannelTest1> {
  // 1. 定義唯一的 Channel 名稱，通常使用反向網域名稱
  final _channel = MethodChannel('com.example.flutterpractice/device');
  Future<int?>? _batteryLevelTask;

  @override
  void initState() {
    super.initState();
    _batteryLevelTask = _fetchBatteryLevel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('MethodChannelTest1')),
        body: FutureBuilder(
            future: _batteryLevelTask,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Column(
                children: [
                  Text("Battery level : ${snapshot.data ?? 'N/A'}"),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _batteryLevelTask = _fetchBatteryLevel();
                        });
                      },
                      child: Text("Fetch Battery Level")),
                ],
              );
            }));
  }

  Future<int?> _fetchBatteryLevel() async {
    try {
      // 2. 調用平台方法，並顯式聲明回傳型別為 int
      return await _channel.invokeMethod<int>('getBatteryLevel');
    } on PlatformException catch (e) {
      // 3. 只在必要時捕獲平台異常，不要寫一堆空的 catch
      print("Failed to get battery level: '${e.message}'.");
      return null;
    }
  }
}
