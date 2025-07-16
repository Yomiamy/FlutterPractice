import 'dart:developer' as developer;
import 'dart:developer';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_practice/constraint_layout/constraint_layout_test_with_constraint_grid.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_practice/homework/github_client/widgets/github_client_app.dart';
import 'package:flutter_practice/tab/favors_page.dart';

import 'firebase/options/firebase_options_beta.dart';
import 'firebase/options/firebase_options_dev.dart';
import 'firebase/options/firebase_options_prod.dart';
import 'homework/github_client/common/global.dart';
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


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  // Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  // final todosApi = LocalStorageTodosApi(
  //     plugin: await SharedPreferences.getInstance(),
  // );
  //
  // bootstrap(todosApi: todosApi);
  // runApp(const MyApp());

  List<Future> futureList = [
    Global.instance.init(),
    _initializeFirebaseApp(),
    _initLocalNotification()
  ];
  Future.wait(futureList).then((_) {
    Timeline.startSync('_initFirebaseCrashlytics');
    _initFirebaseCrashlytics();
    Timeline.finishSync();

    Timeline.startSync('_initFirebaseCloudMessaging');
    _initFirebaseCloudMessaging();
    Timeline.finishSync();

    Timeline.startSync('runApp(const GithubClientApp())');
    runApp(const GithubClientApp());
    Timeline.finishSync();
  });
}

Future<void> _initializeFirebaseApp() async {
  Timeline.startSync('_initializeFirebaseApp');

  const String env = String.fromEnvironment('FLAVOR');
  FirebaseOptions firebaseOptions;
  // 根據環境變數 'FLAVOR' 設定 Firebase 選項。
  switch (env) {
    case 'dev':
      firebaseOptions = DefaultFirebaseOptionsDev.currentPlatform;
      break;
    case 'beta':
      firebaseOptions = DefaultFirebaseOptionsBeta.currentPlatform;
      break;
    default:
      // prod
      firebaseOptions = DefaultFirebaseOptionsProd.currentPlatform;
  }

  await Firebase.initializeApp(options: firebaseOptions);
  Timeline.finishSync();
}

void _initFirebaseCrashlytics() {
  // (要在Firebase.initializeApp後呼叫) 設定 Flutter 錯誤處理，將 Flutter 致命錯誤記錄到 Firebase Crashlytics。
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // (要在Firebase.initializeApp後呼叫) 設定平台錯誤處理，將平台錯誤記錄到 Firebase Crashlytics，並標記為fatal錯誤。
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  developer.log('Firebase Crashlytics initialized', name: 'main');
}

void _initFirebaseCloudMessaging() {
  // Register the background message handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Handle foreground messages
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint('Got a message whilst in the foreground!');
    debugPrint('Message data: ${message.data}');

    if (message.notification != null) {
      debugPrint(
          'Message also contained a notification: ${message.notification?.title} / ${message.notification?.body}');
      // You can display a local notification here if needed
    }
  });

  // Handle messages when the app is opened from a terminated state
  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
    if (message != null) {
      debugPrint('App opened from terminated state with message: ${message.data}');
      // Handle initial message (e.g., navigate to a specific screen)
    }
  });

  // Request permission for iOS/Web
  FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  // Get FCM token
  FirebaseMessaging.instance.getToken().then((token) {
    debugPrint("FCM Token: $token");
    // You can send this token to your backend server
  });
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in your background handler,
  // such as Firestore, make sure you call `initializeApp` before using them.
  await Firebase.initializeApp(); // Re-initialize for background execution if needed
  debugPrint("Handling a background message: ${message.messageId}");
  debugPrint('Message data: ${message.data}');

  if (message.notification != null) {
    debugPrint(
        'Message also contained a notification: ${message.notification?.title} / ${message.notification?.body}');
  }
  // Implement your background message handling logic here

Future<void> _initLocalNotification() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  // 新增ios的settings
  const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
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
