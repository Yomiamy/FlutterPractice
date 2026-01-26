import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class InfiniteListTest extends StatefulWidget {
  const InfiniteListTest({super.key});

  @override
  State<InfiniteListTest> createState() => _InfiniteListTestState();
}

class _InfiniteListTestState extends State<InfiniteListTest> {
  static const MAX_ITEM_COUNT = 100;
  static const END_RETRIEVE_TAG = "沒有更多資料了...";
  final List<String> _items = <String>[];
  bool _isFetchingData = false;

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('InfiniteListTest', style: TextStyle(fontSize: 30)),
        ),
        body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) {
              Text contentText = Text(
                  _items[index],
                  style: const TextStyle(fontSize: 20)
              );

              if(index >= _items.length - 1 && _isFetchingData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    contentText,
                    const Center(child: CircularProgressIndicator(strokeWidth: 2.0))
                  ],
                );
              } else {
                if(index >= _items.length - 1 && !_isFetchingData) {
                  // 延遲執行 _retrieveData 方法，等構建結束後操作
                  SchedulerBinding.instance.addPostFrameCallback((_) {
                    _retrieveData();
                  });

                }
                return contentText;
              }
            },
            separatorBuilder: (_, __) => const Divider(
                height: 1, color: Colors.grey, indent: 10, endIndent: 10),
            itemCount: _items.length));
  }

  void _retrieveData() {
    if (!_isFetchingData
        && _items.length <= MAX_ITEM_COUNT) {
      setState(() => _isFetchingData = true);

      Future.delayed(const Duration(seconds: 2)).then((_) {
        setState(() {
          _items.insertAll(
              _items.length, List.generate(20, (i) => 'Item ${_items.length + i}'));
          _isFetchingData = false;
        });
      });
    } else if (!_items.contains(END_RETRIEVE_TAG)) {
      Future.delayed(const Duration(seconds: 2)).then((_) {
        setState(() {
          _items.add(END_RETRIEVE_TAG);
          _isFetchingData = false;
        });
      });
    }
  }
}
