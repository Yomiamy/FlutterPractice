import 'package:flutter/material.dart';

class AlertDialogTest extends StatefulWidget {
  const AlertDialogTest({super.key});

  @override
  State<AlertDialogTest> createState() => _AlertDialogTestState();
}

class _AlertDialogTestState extends State<AlertDialogTest> {
  int? selectedRadio = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('AlertDialogTest')),
        body: ElevatedButton(
          onPressed: () async {
            await showDialog(
                context: context,
                builder: (context) {
                  int? selectedRadio = 0;

                  return AlertDialog(
                      title: const Text('AlertDialogTest'),
                      content: StatefulBuilder(
                          builder: (context, setState) {
                            return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(4, (index) {
                                  return Radio<int>(
                                      value: index,
                                      groupValue: selectedRadio,
                                      onChanged: (value) {
                                        setState(() => selectedRadio = value);
                                      });
                                })
                            );
                          }
                      )
                  );
                }
            );
          },
          child: const Text('Show AlertDialog'),
        )
    );
  }
}
