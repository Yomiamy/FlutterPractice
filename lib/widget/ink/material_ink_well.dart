import 'package:flutter/material.dart';

class MaterialInk extends StatelessWidget {
  const MaterialInk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('MaterialInk'),
        ),
        body: Material(
          child: Ink(
            color: Colors.blue,
            width: 300,
            height: 50,
            // decoration: BoxDecoration(),
            padding: const EdgeInsets.all(2),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 300.0,
                height: 50.0,
                alignment: const Alignment(0, 0),
                child: const Text('登陸', style: TextStyle(color: Colors.white, fontSize: 16.0))
              ),
            )
          ),
        ));
  }
}
