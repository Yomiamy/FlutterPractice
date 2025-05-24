import 'package:flutter/material.dart';

class ListViewTest2 extends StatelessWidget {
  const ListViewTest2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('ListViewTest1', style: TextStyle(fontSize: 30))),
        body:
            ListView.separated(itemBuilder: (context, index) {
              return const Text('avg=46.05ms', style: TextStyle(fontSize: 18));
            }, itemCount: 40, separatorBuilder: (context, index) {
              return const Divider(color: Colors.blue);
            }));
  }
}
