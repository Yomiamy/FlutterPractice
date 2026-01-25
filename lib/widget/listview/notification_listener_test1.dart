import 'package:flutter/material.dart';

class NotificationListenerTest1 extends StatelessWidget {
  const NotificationListenerTest1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('NotificationListenerTest1'),
        ),
        body: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollStartNotification) {
                debugPrint('ScrollStartNotification');
              } else if (notification is ScrollEndNotification) {
                debugPrint('ScrollEndNotification');
              } else {
                debugPrint('Scroll progress: ${notification.metrics.pixels / notification.metrics.maxScrollExtent}');
              }
              return false;
            },
            child: ListView.builder(
                itemCount: 100,
                itemExtent: 20,
                itemBuilder: (context, index) => ListTile(title: Text("ListTile $index")
                )
            )
        ));
  }
}
