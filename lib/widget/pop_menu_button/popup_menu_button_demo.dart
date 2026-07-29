import 'package:flutter/material.dart';

class PopmenuButtonTest1 extends StatefulWidget {
  const PopmenuButtonTest1({super.key});

  @override
  State<PopmenuButtonTest1> createState() => _PopmenuButtonTest1State();
}

class _PopmenuButtonTest1State extends State<PopmenuButtonTest1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('PopmenuButtonTest1'),
          actions: [
            PopupMenuButton(
                shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                initialValue: "MenuItem1",
                icon: const Icon(Icons.more_vert_rounded),
                tooltip: "PopupMenuButton Test",
                onSelected: (value) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                        SnackBar(content: Text("$value is selected")));
                },
                itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: "MenuItem1",
                        enabled: true,
                        child: Text('MenuItem1'),
                      ),
                      const PopupMenuItem(
                        value: "MenuItem2",
                        enabled: true,
                        child: Text('MenuItem2'),
                      )
                    ])
          ],
        ),
        body: const Center(child: Text('PopMenuButtonTest')));
  }
}
