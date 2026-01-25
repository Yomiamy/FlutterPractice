import 'package:flutter/material.dart';

class GridViewTest3 extends StatelessWidget {
  const GridViewTest3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GridViewTest3'),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Container(
              color: Colors.blue[100 * (index % 9)],
              child: Text('Text $index'),
            );
          },
        ));
  }
}
