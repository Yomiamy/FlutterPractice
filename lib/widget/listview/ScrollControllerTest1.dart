import 'package:flutter/material.dart';

class ScrollControllerTest1 extends StatefulWidget {
  const ScrollControllerTest1({super.key});

  @override
  State<ScrollControllerTest1> createState() => _ScrollControllerTest1State();
}

class _ScrollControllerTest1State extends State<ScrollControllerTest1> {
  final ScrollController _scrollController = ScrollController();
  bool showToTopBtn = false;

  @override
  void initState() {
    super.initState();
    
    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      debugPrint('offset: $offset');

      if (offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (offset >= 1000 && !showToTopBtn) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScrollControllerTest1'),
      ),
      body: ListView.builder(
          itemCount: 100,
          itemExtent: 50,
          controller: _scrollController,
          itemBuilder: (context, index) => ListTile(title: Text("$index"))),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: const Icon(Icons.arrow_upward),
              onPressed: () {
                //返回到顶部时执行动画
                _scrollController.animateTo(
                  .0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease,
                );
              }),
    );
  }
}
