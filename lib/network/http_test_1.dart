import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpTest1 extends StatefulWidget {
  const HttpTest1({super.key});

  @override
  State<HttpTest1> createState() => _HttpTest1State();
}

class _HttpTest1State extends State<HttpTest1> {
  Future<String>? _task;

  @override
  void initState() {
    super.initState();
    _task = _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HTTP Test 1")),
      body: FutureBuilder(
          future: _task,
          builder: (context, snapshot) {
            return Column(
              children: [
                Text(snapshot.connectionState == ConnectionState.waiting
                    ? "Loading..."
                    : "Data is ${snapshot.data?.toString()}"),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _task = _fetchData();
                      });
                    },
                    child: Text("Refresh"))
              ],
            );
          }),
    );
  }

  Future<String> _fetchData() async {
    final url = Uri.https("www.yahoo.com.tw");
    final resp = await http.get(url);

    return resp.headers.toString();
  }
}
