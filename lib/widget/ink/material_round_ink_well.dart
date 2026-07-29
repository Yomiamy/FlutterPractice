import 'package:flutter/material.dart';

class MaterialRoundInk extends StatelessWidget {
  const MaterialRoundInk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MaterialRoundInk'),
        ),
        body: Ink(
          padding: const EdgeInsets.all(2),
          width: 300,
          height: 50,
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: InkWell(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              onTap: () {
                debugPrint("onTap for Login");
              },
              child: const Center(child: Text('Login'))),
        ));
  }
}
