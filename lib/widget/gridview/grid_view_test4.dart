import 'package:flutter/material.dart';

class GridViewTest4 extends StatelessWidget {
  const GridViewTest4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GridViewTest3'),
        ),
        body: GridView.extent(
          childAspectRatio: 2 / 1,
          maxCrossAxisExtent: MediaQuery.of(context).size.width / 3,
          children: List.generate(12, (index) {
            return Card(
              child: Container(
                color: Colors.blue[100 * (index % 9)],
                child: Text('Text $index'),
              ),
            );
          }),
        ));
  }
}
