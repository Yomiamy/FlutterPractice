import 'package:flutter/material.dart';

class CounterModel extends ChangeNotifier {

  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // 通知 UI 更新
  }

}