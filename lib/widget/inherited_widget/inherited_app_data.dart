import 'package:flutter/cupertino.dart';

class InheritedAppData extends InheritedWidget {


  InheritedAppData({
    super.key,
    required this.countData,
    required super.child
  });

  int countData;


  static InheritedAppData? of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<InheritedAppData>();
    return widget;
  }

  @override
  bool updateShouldNotify(InheritedAppData oldWidget) => countData != oldWidget.countData;

}