import 'package:flutter/material.dart';

class CustomScrollViewTest extends StatelessWidget {
  const CustomScrollViewTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const SliverAppBar(
            pinned: true,
            floating: true,
            snap: true,
            expandedHeight: 150.0,
            flexibleSpace:
                FlexibleSpaceBar(title: Text('CustomScrollViewTest'))),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 4.0),
            delegate: SliverChildBuilderDelegate(
              childCount: 8,
              (context, index) {
                return Container(
                  color: Colors.teal[100 * (index % 9)],
                  child: Center(child: Text('grid item $index')),
                );
              },
            ),
          ),
        ),
        SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                color: Colors.teal[100 * (index % 9)],
                child: Center(child: Text('list item $index')),
              );
            }),
            itemExtent: 50.0)
      ],
    ));
  }
}
