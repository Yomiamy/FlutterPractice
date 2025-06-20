import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_practice/constraint_layout/constraint_layout_test_with_constraint_grid.dart';
import 'package:flutter_practice/homework/github_client/widgets/github_client_app.dart';
import 'package:flutter_practice/tab/favors_page.dart';

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
import 'firebase/options/firebase_options_beta.dart';
import 'firebase/options/firebase_options_dev.dart';
import 'firebase/options/firebase_options_prod.dart';
import 'form/custom_input_form_field.dart';
import 'form/custom_input_form_field_test1.dart';
import 'form/form_field_test2.dart';
import 'form/text_field_test1.dart';
import 'gesture/gesture_test1.dart';
import 'homework/Practice_168.dart';
import 'homework/Practice_220.dart';
import 'homework/github_client/common/Global.dart';
import 'homework/github_client/common/global.dart';
import 'homework/github_client/provider/user_change_notifier.dart';
import 'homework/github_client/widgets/github_client_app.dart';
import 'inherited_widget/CounterWidget.dart';
import 'inherited_widget/MediaQueryWdiget.dart';
import 'ink/ClickInkWell.dart';
import 'ink/MaterialBgInkWell.dart';
import 'ink/MaterialInk.dart';
import 'l10n/generated/l10n.dart';
import 'layout/align_test1.dart';
import 'layout/flex_test1.dart';
import 'lifecycle/LifecycleMonitor.dart';
import 'lifecycle/inherited_widget_test1.dart';
import 'lifecycle/will_pop_scope_test1.dart';
import 'listview/InfiniteListTest.dart';
import 'listview/ListViewTest1.dart';
import 'listview/ListViewTest2.dart';
import 'listview/custom_scroll_view_test.dart';
import 'listview/notification_listener_test1.dart';
import 'locale/locale_string_test1.dart';
import 'overlay/OverlayTest1.dart';

Future<void> main() async {
  // Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  // final todosApi = LocalStorageTodosApi(
  //     plugin: await SharedPreferences.getInstance(),
  // );
  //
  // bootstrap(todosApi: todosApi);
  // runApp(const MyApp());

  const String env = String.fromEnvironment('FLAVOR');
  List<Future> fetureList = [];

  fetureList.add(Global.instance.init());
  FirebaseOptions firebaseOptions;
  switch (env) {
    case 'dev':
      firebaseOptions = DefaultFirebaseOptionsDev.currentPlatform;
      break;
    case 'beta':
      firebaseOptions = DefaultFirebaseOptionsBeta.currentPlatform;
      break;
    default: // prod
      firebaseOptions = DefaultFirebaseOptionsProd.currentPlatform;
  }
  fetureList.add(Firebase.initializeApp(options: firebaseOptions));

  Future.wait(fetureList).then((_) => runApp(const GithubClientApp()));
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
        // theme: ThemeData(
        //     colorScheme: const ColorScheme.light(
        //         primary: Color.fromRGBO(72, 74, 126, 1)
        //     )
        // ),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        localizationsDelegates: const [
          S.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        locale: const Locale('zh', 'TW'),
        supportedLocales: S.delegate.supportedLocales,
        home: const LocaleStringTest1());
  }
}
