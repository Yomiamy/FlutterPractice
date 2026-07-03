import 'dart:isolate';

import 'package:flutter/material.dart';

class IsolateTest1 extends StatefulWidget {
  const IsolateTest1({super.key});

  @override
  State<IsolateTest1> createState() => _IsolateTest1State();
}

class _IsolateTest1State extends State<IsolateTest1> {
  Isolate? _isolate;
  String? _receiveMsg;
  final ReceivePort _receivePort = ReceivePort();
  SendPort? _toSubIsolateSendPort; // 用於儲存傳送給子 Isolate 的 SendPort

  @override
  void initState() {
    super.initState();
    _initIsolate();
  }

  @override
  void dispose() {
    _isolate?.kill();
    _receivePort.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Isolate Test1")),
      body: Column(
        children: [
          Text(_receiveMsg ?? "No message"),
          ElevatedButton(
            onPressed: () {
              // 當按鈕被按下時，將訊息透過交換取得的 SendPort 傳送給子 Isolate
              if (_toSubIsolateSendPort != null) {
                _toSubIsolateSendPort!.send("data in send2");
              } else {
                print("子 Isolate 的通訊通道尚未建立完成");
              }
            },
            child: const Text("Send2"),
          )
        ],
      ),
    );
  }

  void _initIsolate() async {
    // 1. 先監聽主 Isolate 的 ReceivePort
    _receivePort.listen((message) {
      if (message is SendPort) {
        // 握手：子 Isolate 傳回來的第一個訊息是它的 SendPort
        _toSubIsolateSendPort = message;
      } else {
        // 之後收到的是子 Isolate 回傳的業務訊息
        setState(() {
          _receiveMsg = message.toString();
        });
      }
    });

    try {
      // 2. 啟動子 Isolate，把主 Isolate 的 sendPort 傳給它
      _isolate = await Isolate.spawn(_isolateEntry, _receivePort.sendPort);
    } catch (e) {
      print("建立 Isolate 失敗: $e");
    }
  }

  // 靜態 Entrypoint，在新 Isolate 中獨立運行
  static void _isolateEntry(SendPort mainSendPort) {
    // A. 建立子 Isolate 自己專屬的 ReceivePort
    final ReceivePort subReceivePort = ReceivePort();

    // B. 將子 Isolate 的 sendPort 送回給主 Isolate，完成「雙向通訊通道」的握手
    mainSendPort.send(subReceivePort.sendPort);
    mainSendPort.send("init isolate...");

    // C. 開始監聽主 Isolate 傳送過來的任何訊息
    subReceivePort.listen((message) {
      print("子 Isolate 收到主 Isolate 傳來的訊息: $message");

      // 可以在這裡處理耗時工作，並將處理結果送回給主 Isolate
      mainSendPort.send("子 Isolate 已收到: '$message' 並完成處理");
    });
  }
}
