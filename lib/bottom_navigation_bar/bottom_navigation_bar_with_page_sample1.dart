import 'package:flutter/material.dart';

class BottomNavigationBarWithPageSample1 extends StatefulWidget {
  const BottomNavigationBarWithPageSample1({super.key});

  @override
  State<BottomNavigationBarWithPageSample1> createState() => _BottomNavigationBarWithPageSample1State();
}


class _BottomNavigationBarWithPageSample1State extends State<BottomNavigationBarWithPageSample1> {

  int _tabIndex = 0;
  final List<Icon> _normalIcon = const [
    Icon(Icons.home),
    Icon(Icons.message),
    Icon(Icons.people)
  ];
  final List<String> _normalTitle = const [
    "首頁",
    "消息",
    "我的"
  ];

  final List<Widget> _pages = const [
    ItemPage(index: "0"),
    ItemPage(index: "1"),
    ItemPage(index: "2")
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBarSample1'),
      ),
      bottomNavigationBar: buildBottomNavigation(),
      body: _pages[_tabIndex],
  );

  BottomNavigationBar buildBottomNavigation() => BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: _tabIndex,
    backgroundColor: Colors.white,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    iconSize: 24.0,
    items: <BottomNavigationBarItem> [
      BottomNavigationBarItem(icon: _normalIcon[0], label: _normalTitle[0]),
      BottomNavigationBarItem(icon: _normalIcon[1], label: _normalTitle[1]),
      BottomNavigationBarItem(icon: _normalIcon[2], label: _normalTitle[2])
    ],
    onTap: (index) {
      setState(() {
        _tabIndex = index;
      });
    },
  );
}

class ItemPage extends StatelessWidget {

  final String _index;

  const ItemPage({super.key, required String index}): _index = index;

  @override
  Widget build(BuildContext context) => Center(
    child: Text("Page $_index"),
  );
}

