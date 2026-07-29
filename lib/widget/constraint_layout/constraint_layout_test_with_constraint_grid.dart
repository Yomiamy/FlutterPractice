import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';

class ConstraintLayoutTestWithConstraintGrid extends StatelessWidget {
  final List<Color> colors = [
    Colors.redAccent,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.orangeAccent,
    Colors.yellow,
    Colors.pink,
    Colors.lightBlueAccent
  ];

  ConstraintLayoutTestWithConstraintGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ConstraintLayoutTestWithConstraintGrid'),
        ),
        body: ConstraintLayout(
          children: [
            ...constraintGrid(
                id: ConstraintId('horizontalList'),
                left: parent.left,
                top: parent.top,
                margin: const EdgeInsets.only(
                  left: 100,
                  top: 100,
                ),
                itemCount: 10,
                columnCount: 10,
                itemWidth: wrapContent,
                itemHeight: 100,
                itemBuilder: (index, _, __) {
                  return Container(
                    color: colors[index % colors.length],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text('child $index'),
                  );
                },
                itemMarginBuilder: (index, _, __) {
                  return const EdgeInsets.only(
                    left: 10,
                    top: 10,
                  );
                })
          ],
        ));
  }
}
