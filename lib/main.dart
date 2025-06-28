import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/tab/favors_page.dart';

import 'firebase/options/firebase_options_beta.dart';
import 'firebase/options/firebase_options_dev.dart';
import 'firebase/options/firebase_options_prod.dart';
import 'homework/github_client/common/global.dart';
import 'homework/github_client/widgets/github_client_app.dart';

Future<void> main() async {
  // Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  // final todosApi = LocalStorageTodosApi(
  //     plugin: await SharedPreferences.getInstance(),
  // );
  //
  // bootstrap(todosApi: todosApi);

  List<Future> fetureList = [];

  fetureList.add(Global.instance.init());

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
  fetureList.add(Firebase.initializeApp(options: firebaseOptions));

  Future.wait(fetureList).then((_) {
    _initFirebaseCrashlytics();
    _initFirebaseCloudMessaging();

    runApp(const GithubClientApp());
  });
}

void _initFirebaseCrashlytics() {
  // (要在Firebase.initializeApp後呼叫) 設定 Flutter 錯誤處理，將 Flutter 致命錯誤記錄到 Firebase Crashlytics。
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // (要在Firebase.initializeApp後呼叫) 設定平台錯誤處理，將平台錯誤記錄到 Firebase Crashlytics，並標記為fatal錯誤。
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
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
