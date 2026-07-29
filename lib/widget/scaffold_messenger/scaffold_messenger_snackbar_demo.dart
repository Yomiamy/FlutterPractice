import 'package:flutter/material.dart';

class ScaffoldMessengerTrigger extends StatefulWidget {
  const ScaffoldMessengerTrigger({super.key});

  @override
  State<ScaffoldMessengerTrigger> createState() =>
      _ScaffoldMessengerTriggerState();
}

class _ScaffoldMessengerTriggerState extends State<ScaffoldMessengerTrigger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ScaffoldMessengerTrigger'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: const Text('SnackBar message'),
                action: SnackBarAction(
                  label: "Undo",
                  onPressed: () {
                    debugPrint("Undo pressed");
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                ),
              ));
          },
          child: const Icon(Icons.message),
        ));
  }
}
