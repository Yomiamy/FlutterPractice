import 'package:flutter/material.dart';

import '../../gen/assets_config.dart';

class CustomScrollviewTest1 extends StatefulWidget {
  const CustomScrollviewTest1({super.key});

  @override
  State<CustomScrollviewTest1> createState() => _CustomScrollviewTest1State();
}

class _CustomScrollviewTest1State extends State<CustomScrollviewTest1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'CustomScrollviewTest1',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              background: AssetImageRes.animalPic1.image(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 4.0,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: Text('grid item $index'),
                  );
                }, childCount: 30)),
          ),
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('list item $index'),
                );
              }),
              itemExtent: 50)
        ],
      ),
    );
  }
}
