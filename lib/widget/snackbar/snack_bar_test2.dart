import 'package:flutter/material.dart';

class SnackBarTest2 extends StatefulWidget {
  const SnackBarTest2({super.key});

  @override
  State<SnackBarTest2> createState() => _SnackBarTest1State();
}

class _SnackBarTest1State extends State<SnackBarTest2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBarTest2"),
      ),
      body: Column(spacing: 10, children: <Widget>[
        const Text("Show snackbar"),
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('This is snackbar 2'),
                duration: const Duration(seconds: 3),
                action: SnackBarAction(
                    label: 'remove',
                    onPressed: () {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                    }),
              ),
            );
          },
          child: const Text('Show'),
        )
      ]),
    );
  }
}
