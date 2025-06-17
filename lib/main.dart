import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/async/future/future_build_test1.dart';
import 'package:flutter_practice/async/future/stream_build_test1.dart';
import 'package:flutter_practice/bloc/infinite_list/simple_bloc_observer.dart';
import 'package:flutter_practice/bloc/login/bloc/authentication_bloc.dart';
import 'package:flutter_practice/bloc/login/bloc/login_bloc.dart';
import 'package:flutter_practice/bloc/login/repository/authentication_repository.dart';
import 'package:flutter_practice/bloc/login/repository/user_repository.dart';
import 'package:flutter_practice/bloc/login/view/app_view.dart';
import 'package:flutter_practice/bottom_navigation_bar/bottom_navigation_bar_sample1.dart';
import 'package:flutter_practice/dialog/alert_dialog_test1.dart';
import 'package:flutter_practice/dialog/date_picker_dialog_test1.dart';
import 'package:flutter_practice/dialog/general_dialog_test1.dart';
import 'package:flutter_practice/dialog/simple_dialog_test1.dart';
import 'package:flutter_practice/draggable_scrollable_sheet/BottomDragWidget.dart';
import 'package:flutter_practice/draggable_scrollable_sheet/DraggableScrollableSheetPage.dart';
import 'package:flutter_practice/form/form_field_test1.dart';
import 'package:flutter_practice/gesture/ImageDoubleTapScaleWidget.dart';
import 'package:flutter_practice/gesture/ImageTapWidget.dart';
import 'package:flutter_practice/gesture/TapTextWidget.dart';
import 'package:flutter_practice/homework/Practice_218.dart';
import 'package:flutter_practice/homework/Practice_227.dart';
import 'package:flutter_practice/homework/Practice_6.dart';
import 'package:flutter_practice/ink/MaterialRoundInk.dart';
import 'package:flutter_practice/listview/ScrollControllerTest1.dart';
import 'package:flutter_practice/listview/grid_view_test1.dart';
import 'package:flutter_practice/permission/permission_handle_test1.dart';
import 'package:flutter_practice/pop_menu_button/PopMenuButtonTest1.dart';
import 'package:flutter_practice/provider/provider_test1.dart';
import 'package:flutter_practice/route/page_route_builder_test1.dart';
import 'package:flutter_practice/route/route_page_test1.dart';
import 'package:flutter_practice/route/route_page_test3.dart';
import 'package:flutter_practice/route/route_page_with_naming_route_test1.dart';
import 'package:flutter_practice/scaffold_messenger/ScaffoldMessengerTrigger.dart';
import 'package:flutter_practice/scrollable/SingleChildScrollViewTest1.dart';
import 'package:flutter_practice/shadow/ShadowTextTest1.dart';
import 'package:flutter_practice/layout/stack_test1.dart';
import 'package:flutter_practice/tab/favors_list.dart';
import 'package:flutter_practice/tab/favors_page.dart';
import 'package:flutter_practice/url/LinkifyTest1.dart';
import 'package:flutter_practice/widget/BlurTest1.dart';
import 'package:flutter_practice/widget/BlurTest2.dart';
import 'package:flutter_practice/widget/BorderTest1.dart';
import 'package:flutter_practice/widget/CircleImageTest1.dart';
import 'package:flutter_practice/widget/const_widget_test.dart';
import 'package:flutter_practice/widget/dialog/AlertDialogTest.dart';
import 'package:local_storage_todos_api/local_storage_todos_api.dart';

import 'animation/AnimatedWidget.dart';
import 'animation/AnimationTest1.dart';
import 'animation/TweenAnimationBuilder.dart';
import 'bloc/infinite_list/view/posts_page.dart';
import 'bloc/timer/bloc/timer_view.dart';
import 'bottom_app_bar/bottom_app_bar_sample1.dart';
import 'bottom_navigation_bar/bottom_navigation_bar_with_page_sample1.dart';
import 'dialog/alert_dialog_test2_loading.dart';
import 'dialog/modal_bottom_sheet_dialog_test1.dart';
import 'dismissable/dismissable_list.dart';
import 'draggable_scrollable_sheet/BottomDragTabWidget.dart';
import 'form/custom_input_form_field.dart';
import 'form/custom_input_form_field_test1.dart';
import 'form/form_field_test2.dart';
import 'form/text_field_test1.dart';
import 'gesture/gesture_test1.dart';
import 'homework/github_client/common/global.dart';
import 'homework/github_client/provider/user_change_notifier.dart';
import 'layout/align_test1.dart';
import 'layout/flex_test1.dart';
import 'homework/Practice_168.dart';
import 'homework/Practice_220.dart';
import 'inherited_widget/CounterWidget.dart';
import 'inherited_widget/MediaQueryWdiget.dart';
import 'ink/ClickInkWell.dart';
import 'ink/MaterialBgInkWell.dart';
import 'ink/MaterialInk.dart';
import 'lifecycle/LifecycleMonitor.dart';
import 'lifecycle/inherited_widget_test1.dart';
import 'lifecycle/will_pop_scope_test1.dart';
import 'listview/InfiniteListTest.dart';
import 'listview/ListViewTest1.dart';
import 'listview/ListViewTest2.dart';
import 'listview/custom_scroll_view_test.dart';
import 'listview/notification_listener_test1.dart';
import 'overlay/OverlayTest1.dart';

Future<void> main() async {
  // Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  // final todosApi = LocalStorageTodosApi(
  //     plugin: await SharedPreferences.getInstance(),
  // );
  //
  // bootstrap(todosApi: todosApi);

  Global.instance.init().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // theme: ThemeData(
        //     textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
        //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.transparent),
        //     useMaterial3: true),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // theme: ThemeData(
        //     colorScheme: const ColorScheme.light(
        //         primary: Color.fromRGBO(72, 74, 126, 1)
        //     )
        // ),
        home: FavorsPage());
  }
}
