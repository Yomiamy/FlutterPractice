import 'package:flutter/material.dart';

class BottomNavigationBarSample1 extends StatefulWidget {
  const BottomNavigationBarSample1({super.key});

  @override
  State<BottomNavigationBarSample1> createState() => _BottomNavigationBarSample1State();
}


class _BottomNavigationBarSample1State extends State<BottomNavigationBarSample1> {

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

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBarSample1'),
      ),
      bottomNavigationBar: buildBottomNavigation());

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
