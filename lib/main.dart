import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/bloc/infinite_list/simple_bloc_observer.dart';
import 'package:flutter_practice/draggable_scrollable_sheet/BottomDragWidget.dart';
import 'package:flutter_practice/draggable_scrollable_sheet/DraggableScrollableSheetPage.dart';
import 'package:flutter_practice/gesture/ImageDoubleTapScaleWidget.dart';
import 'package:flutter_practice/gesture/ImageTapWidget.dart';
import 'package:flutter_practice/gesture/TapTextWidget.dart';

import 'bloc/increment_count/bloc.dart';
import 'bloc/increment_count/view.dart';
import 'bloc/infinite_list/view/posts_page.dart';
import 'draggable_scrollable_sheet/BottomDragTabWidget.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PostsPage(),
    );
  }
}
