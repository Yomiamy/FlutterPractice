import 'package:flutter/material.dart';

class ModalBottomSheetDialogTest1 extends StatefulWidget {
  const ModalBottomSheetDialogTest1({super.key});

  @override
  State<ModalBottomSheetDialogTest1> createState() =>
      _ModalBottomSheetDialogTest1State();
}

class _ModalBottomSheetDialogTest1State
    extends State<ModalBottomSheetDialogTest1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ModalBottomSheetDialogTest1"),
        ),
        body: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) {
                  return ListView.builder(
                      itemCount: 30,
                      itemBuilder: (context, i) {
                        return ListTile(
                          title: Text('Item $i'),
                        );
                      });
                });
          },
          child: const Text('Show modal bottom sheet'),
        ));
  }
}
