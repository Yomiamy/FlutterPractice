import 'package:flutter/material.dart';

class DismissableList extends StatefulWidget {
  const DismissableList({super.key});

  @override
  State<DismissableList> createState() => _DismissableState();
}

class _DismissableState extends State<DismissableList> {
  
  final List<String> _list = ["item1", "item2", "item3"];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('DismissableList'),
        ),
        body: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, pos) {
              String item = _list[pos];
              // 要確保key是唯一的, 才能正確的使Dismissible從Widget Tree中移除
              return Dismissible(
                  key: Key('DismissableList_$item'),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const Icon(
                      Icons.delete,
                      color: Color(0xAAFFFFFF),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 60,
                    child: Text(item)
                  ),
                  onDismissed: (_) {
                    setState(() {
                      _list.removeAt(pos);
                    });
                  },
              );
            })
    );
  }
}
