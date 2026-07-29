import 'package:flutter/material.dart';

class BottomSheetTest1 extends StatefulWidget {
  const BottomSheetTest1({super.key});

  @override
  State<BottomSheetTest1> createState() => _BottomSheetTest1State();
}

class _BottomSheetTest1State extends State<BottomSheetTest1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BottomSheetTest1"),
      ),
      body: Column(spacing: 20, children: <Widget>[
        const Text('bottom sheet test1'),
        ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text('This is a bottom sheet sample'),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close'),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          child: const Text('Show BottomSheet'),
        )
      ]),
    );
  }
}
