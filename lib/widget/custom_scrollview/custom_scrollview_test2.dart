import 'package:flutter/material.dart';

import '../../gen/assets_config.dart';

class CustomScrollviewTest2 extends StatefulWidget {
  const CustomScrollviewTest2({super.key});

  @override
  State<CustomScrollviewTest2> createState() => _CustomScrollviewTest2State();
}

class _CustomScrollviewTest2State extends State<CustomScrollviewTest2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'CustomScrollviewTest2',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 3.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              centerTitle: true,
              background: AssetImageRes.animalPic1.image(fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              margin: const EdgeInsets.all(16),
              color: Colors.purple.shade100,
              alignment: Alignment.center,
              child: const Text('Header Area (SliverToBoxAdapter)',
                  style: TextStyle(fontSize: 18)),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.orange[100 * (index % 9 + 1)],
                  child: Text('Grid $index'),
                );
              },
              childCount: 12,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  height: 60,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  color: Colors.blue[100 * (index % 9 + 1)],
                  alignment: Alignment.center,
                  child: Text('List Item $index'),
                );
              },
              childCount: 15,
            ),
          ),
        ],
      ),
    );
  }
}
