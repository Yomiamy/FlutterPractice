import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class SimpleDialogTest1 extends StatefulWidget {
  const SimpleDialogTest1({super.key});

  @override
  State<SimpleDialogTest1> createState() => _SimpleDialogTest1State();
}

class _SimpleDialogTest1State extends State<SimpleDialogTest1> {
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("SimpleDialogTest1"),
        ),
        body: ElevatedButton(
          onPressed: () async {
            int i = await showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: const Text('請選擇'),
                    children: [
                      SimpleDialogOption(
                        onPressed: () => Navigator.pop(context, 1),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Text("簡體"),
                        ),
                      ),
                      SimpleDialogOption(
                        onPressed: () => Navigator.pop(context, 2),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Text("英文"),
                        ),
                      ),
                      SimpleDialogOption(
                        onPressed: () => Navigator.pop(context, 3),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: Text("繁體"),
                        ),
                      )
                    ],
                  );
                });

            Toast.show("選擇的語系為: $i");
          },
          child: const Text('Show SimpleDialog'),
        ));
  }
}
