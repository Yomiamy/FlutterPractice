import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'Song.dart';

class DisplayJsonTest1 extends StatefulWidget {
  const DisplayJsonTest1({super.key});

  @override
  State<DisplayJsonTest1> createState() => _DisplayJsonTest1State();
}

class _DisplayJsonTest1State extends State<DisplayJsonTest1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("DisplayJsonTest1"),
        ),
        body: FutureBuilder(
            future: getSongInfo(),
            builder: (context, snapShot) {
              return Text(snapShot.data ?? "Empty");
            }));
  }

  Future<String> getSongInfo() async {
    var response = await get(Uri.parse('https://some-random-api.com/others/lyrics?title=how long will i love you'));
    Map<String, dynamic> songMap = jsonDecode(response.body);
    return Song.fromJson(songMap).toString();
  }
}
