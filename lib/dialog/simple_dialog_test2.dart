import 'package:flutter/material.dart';

class SimpleDialogTest2 extends StatefulWidget {
  const SimpleDialogTest2({super.key});

  @override
  State<SimpleDialogTest2> createState() => _SimpleDialogTest2State();
}

class _SimpleDialogTest2State extends State<SimpleDialogTest2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SimpleDialogTest2"),
      ),
      body: Column(children: <Widget>[
        const Text('simple dialog test2'),
        ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: const Text('Choose one option'),
                    children: List.generate(10, (index) {
                      return SimpleDialogOption(
                        child: Text('選項 $index'),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 3),
                              content: Text('選項 $index'),
                            ),
                          );
                        },
                      );
                    }),
                  );
                });
          },
          child: const Text('Show Dialog'),
        )
      ]),
    );
  }
}
