import 'package:flutter/material.dart';

class StreamBuildTest1 extends StatefulWidget {
  const StreamBuildTest1({super.key});

  @override
  State<StreamBuildTest1> createState() => _StreamBuildTest1State();
}

class _StreamBuildTest1State extends State<StreamBuildTest1> {

  Stream<String> mockFetchData() {
    return Stream.periodic(const Duration(seconds: 2), (i) {
      if (i >= 5) {
        throw "Stream completed manually.";
      }
      return "mockData $i";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('StreamBuildTest1'),
        ),
        body: StreamBuilder(
            stream: mockFetchData(),
            builder: (context, snapshot) {
              if(snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }

              if(snapshot.connectionState == ConnectionState.waiting) {
                return const Text("等待數據....");
              } else if(snapshot.connectionState == ConnectionState.active) {
                return Text('Data: ${snapshot.data}');
              } else if(snapshot.connectionState == ConnectionState.done) {
                return const Text('Stream關閉...');
              } else {
                return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                );
              }
            }
        ));
  }
}
