import 'package:flutter/material.dart';

class FutureBuildTest1 extends StatefulWidget {
  const FutureBuildTest1({super.key});

  @override
  State<FutureBuildTest1> createState() => _FutureBuildTest1State();
}

class _FutureBuildTest1State extends State<FutureBuildTest1> {

  Future<String> mockFetchData() async {
    await Future.delayed(const Duration(seconds: 30));
    return "mockFetchData";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FutureBuildTest1'),
        ),
        body: FutureBuilder(
            initialData: "N/A",
            future: mockFetchData(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.done) {
                if(snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else {
                  return Text('Data: ${snapshot.data}');
                }
              } else {
                return Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              }
            }
        ));
  }
}
