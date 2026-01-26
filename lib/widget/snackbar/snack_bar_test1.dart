import 'package:flutter/material.dart';

class SnackBarTest1 extends StatefulWidget {
  const SnackBarTest1({super.key});

  @override
  State<SnackBarTest1> createState() => _SnackBarTest1State();
}

class _SnackBarTest1State extends State<SnackBarTest1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBarTest1"),
      ),
      body: Column(spacing: 10, children: <Widget>[
        const Text("Show snackbar"),
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('This is snackbar 1'),
                duration: Duration(seconds: 3),
              ),
            );
          },
          child: const Text('Show'),
        )
      ]),
    );
  }
}
