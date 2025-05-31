import 'package:flutter/material.dart';

class AlertDialogTest2Loading extends StatefulWidget {
  const AlertDialogTest2Loading({super.key});

  @override
  State<AlertDialogTest2Loading> createState() =>
      _AlertDialogTest2LoadingState();
}

class _AlertDialogTest2LoadingState extends State<AlertDialogTest2Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("AlertDialogTest2Loading"),
        ),
        body: ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return const UnconstrainedBox(
                    child: SizedBox(
                      width: 250,
                      child: AlertDialog(
                          content:  Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 26),
                              SizedBox(width: 50, height:50, child: CircularProgressIndicator()),
                              SizedBox(height: 26),
                              Text('加載中...'),
                            ],
                          )
                      ),
                    ),
                  );
                });
          },
          child: const Text('Show loading dialog'),
        ));
  }
}
