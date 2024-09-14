import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/bloc/increment_count_with_test/bloc/increment_count_bloc.dart';
import 'package:flutter_practice/bloc/infinite_list/simple_bloc_observer.dart';
import 'package:flutter_practice/bloc/login/bloc/authentication_bloc.dart';
import 'package:flutter_practice/bloc/login/bloc/login_bloc.dart';
import 'package:flutter_practice/bloc/login/repository/authentication_repository.dart';
import 'package:flutter_practice/bloc/login/repository/user_repository.dart';
import 'package:flutter_practice/bloc/login/view/app_view.dart';
import 'package:flutter_practice/bottom_navigation_bar/bottom_navigation_bar_sample1.dart';
import 'package:flutter_practice/draggable_scrollable_sheet/BottomDragWidget.dart';
import 'package:flutter_practice/draggable_scrollable_sheet/DraggableScrollableSheetPage.dart';
import 'package:flutter_practice/gesture/ImageDoubleTapScaleWidget.dart';
import 'package:flutter_practice/gesture/ImageTapWidget.dart';
import 'package:flutter_practice/gesture/TapTextWidget.dart';
import 'package:flutter_practice/ink/MaterialRoundInk.dart';
import 'package:flutter_practice/pop_menu_button/PopMenuButtonTest1.dart';
import 'package:flutter_practice/scaffold_messenger/ScaffoldMessengerTrigger.dart';
import 'package:flutter_practice/text_field/CursotTextField.dart';
import 'package:flutter_practice/text_field/FocusNodeTextField.dart';
import 'package:flutter_practice/text_field/InputDecorationTextFeild.dart';
import 'package:flutter_practice/text_field/InputDecorationTextFeild2.dart';
import 'package:flutter_practice/text_field/LabelTextTextField.dart';
import 'package:flutter_practice/text_field/LengthLineLimitTextField.dart';
import 'package:flutter_practice/text_field/SearchStaticBarTextField.dart';
import 'package:local_storage_todos_api/local_storage_todos_api.dart';

import 'bloc/increment_count_with_test/view/increment_count_page.dart';
import 'bloc/infinite_list/view/posts_page.dart';
import 'bloc/timer/bloc/timer_view.dart';
import 'bottom_app_bar/bottom_app_bar_sample1.dart';
import 'bottom_navigation_bar/bottom_navigation_bar_with_page_sample1.dart';
import 'dismissable/dismissable_list.dart';
import 'draggable_scrollable_sheet/BottomDragTabWidget.dart';
import 'ink/ClickInkWell.dart';
import 'ink/MaterialBgInkWell.dart';
import 'ink/MaterialInk.dart';
import 'lifecycle/LifecycleMonitor.dart';

Future<void> main() async {
  // Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  // final todosApi = LocalStorageTodosApi(
  //     plugin: await SharedPreferences.getInstance(),
  // );
  //
  // bootstrap(todosApi: todosApi);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),
        theme: ThemeData(
            colorScheme: const ColorScheme.light(
                primary: Color.fromRGBO(72, 74, 126, 1)
            )
        ),
        home: const LifecycleMonitor());
  }
}
