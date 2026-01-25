import 'package:flutter/material.dart';

class GridViewTest2 extends StatelessWidget {
  const GridViewTest2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GridViewTest2'),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          children: List.generate(
            9,
            (index) {
              return Container(
                color: Colors.blue[100 * (index % 9)],
                child: Center(
                  child: Text('text $index'),
                ),
              );
            },
          ),
        ));
  }
}
