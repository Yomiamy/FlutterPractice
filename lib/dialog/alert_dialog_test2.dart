import 'package:flutter/material.dart';

class AlertDialogTest1 extends StatefulWidget {
  const AlertDialogTest1({super.key});

  @override
  State<AlertDialogTest1> createState() => _AlertDialogTest1State();
}

class _AlertDialogTest1State extends State<AlertDialogTest1> {
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
                      content: StatefulBuilder(builder: (context, setState) {
                        return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(4, (index) {
                              return RadioListTile<int>(
                                  value: index,
                                  groupValue: selectedRadio,
                                  onChanged: (value) {
                                    setState(() => selectedRadio = value);
                                  });
                            }));
                      }));
                });
          },
          child: const Text('Show AlertDialog'),
        ));
  }
}
