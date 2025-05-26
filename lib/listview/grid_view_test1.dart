import 'package:flutter/material.dart';

class GridViewTest1 extends StatelessWidget {
  const GridViewTest1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GridViewTest1'),
        ),
        body: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0
            ),
          children: const [
            Icon(Icons.add),
            Icon(Icons.macro_off),
            Icon(Icons.mic),
            Icon(Icons.abc_outlined),
            Icon(Icons.kayaking),
            Icon(Icons.tab_sharp),
            Icon(Icons.yard),
            Icon(Icons.zoom_in)
          ]
        )
    );
  }
}
