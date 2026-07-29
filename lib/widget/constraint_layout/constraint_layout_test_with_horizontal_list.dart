import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';

class ConstraintLayoutTestWithHorizontalList extends StatefulWidget {
  const ConstraintLayoutTestWithHorizontalList({super.key});

  @override
  State<ConstraintLayoutTestWithHorizontalList> createState() =>
      _ConstraintLayoutTestWithHorizontalListState();
}

class _ConstraintLayoutTestWithHorizontalListState
    extends State<ConstraintLayoutTestWithHorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ConstraintLayoutTestWithHorizontalList'),
      ),
      body: ConstraintLayout().open(() {
        ConstraintId titleConstraintId = ConstraintId('title');
        const Text(
          'Title',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ).applyConstraint(
          id: titleConstraintId,
          left: parent.left,
          top: parent.top,
        );

        ListView.builder(
          itemExtent: 100,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                'Item $index',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text('$index'),
            );
          },
        ).applyConstraint(
          left: parent.left,
          top: titleConstraintId.bottom,
          right: parent.right,
        );
      }),
    );
  }
}
