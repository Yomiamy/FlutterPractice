import 'dart:developer';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_practice/widget/container/container_test.dart';

import 'firebase/options/firebase_options_beta.dart';
import 'firebase/options/firebase_options_dev.dart';
import 'firebase/options/firebase_options_prod.dart';
import 'l10n/generated/l10n.dart';

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
  runApp(const MyApp());

  // ======================================================

  // List<Future> futureList = [
  //   Global.instance.init(),
  //   _initializeFirebaseApp(),
  //   _initLocalNotification()
  // ];
  // Future.wait(futureList).then((_) {
  //   Timeline.startSync('_initFirebaseCrashlytics');
  //   _initFirebaseCrashlytics();
  //   Timeline.finishSync();
  //
  //   Timeline.startSync('_initFirebaseCloudMessaging');
  //   _initFirebaseCloudMessaging();
  //   Timeline.finishSync();
  //
  //   Timeline.startSync('runApp(const GithubClientApp())');
  //   runApp(const GithubClientApp());
  //   Timeline.finishSync();
  // });
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
}

void _initFirebaseCloudMessaging() {
  // 監聽背景訊息(Notification Message)
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // 監聽前景訊息(Notification Message)
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint('onMessage: Got a message whilst in the foreground!');
    debugPrint('Message data: ${message.data}');

    if (message.notification != null) {
      debugPrint(
          'onMessage: Message also contained a notification: ${message.notification?.title} / ${message.notification?.body}');

      // 在此處顯示本地通知
      flutterLocalNotificationsPlugin.show(
          0,
          message.notification!.title,
          message.notification!.body,
          const NotificationDetails(
              android: AndroidNotificationDetails(
                'default_channel_id',
                '預設頻道',
                importance: Importance.max,
                priority: Priority.high,
              ),
              iOS: DarwinNotificationDetails(
                // 當應用程式在前台且顯示通知時，顯示提示 (僅適用於 iOS 10 及更高版本)
                presentAlert: true,
                // 當應用程式在前台且顯示通知時，顯示徽章編號 (僅適用於 iOS 10 及更高版本)
                presentBadge: true,
                // 當應用程式在前台且顯示通知時，播放聲音 (僅適用於 iOS 10 及更高版本)
                presentSound: true,
                // 顯示通知時播放的特定聲音
                // sound: String?,
                // 應用程式圖示的徽章編號
                // badgeNumber: int?,
                // attachments: List<DarwinNotificationAttachment>?, (僅適用於 iOS 10 及更高版本)
              )),
          payload: message.data.toString());
    }
  });

  // 處理從終止狀態開啟應用程式時的訊息(Notification Message)
  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
    debugPrint('getInitialMessage: App opened from a notification');

    if (message != null) {
      debugPrint(
          'getInitialMessage: App opened from terminated state with message: ${message.data}');
      // 處理初始訊息 (例如，導航到特定螢幕)
    }
  });

  // 處理從背景狀態開啟應用程式時的訊息(Notification Message)
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    debugPrint('onMessageOpenedApp: App opened from a notification: ${message.data}');
  });

  // 要求 Android/iOS/Web 的權限
  FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  // 取得 FCM 權杖
  FirebaseMessaging.instance.getToken().then((token) {
    debugPrint("FCM Token: $token");
    // 你可以將此權杖傳送到你的後端伺服器
  });
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // 如果您將在後台處理程序中使用其他 Firebase 服務，
  // 例如 Firestore，請確保在使用它們之前調用 `initializeApp`。
  await Firebase.initializeApp(); // 如果需要，重新初始化以進行後台執行
  debugPrint("MessagingBackgroundHandler: Handling a background message: ${message.messageId}");
  debugPrint('Message data: ${message.data}');

  if (message.notification != null) {
    debugPrint(
        'Message also contained a notification: ${message.notification?.title} / ${message.notification?.body}');
  }
  // 在此處實現您的後台消息處理邏輯
}

@pragma('vm:entry-point')
void _localNotificationTapBackgroundHandler(NotificationResponse response) {
  // // 當應用程式在後台時，顯示通知點擊後在此處處理通知點擊事件(Data Message)
  debugPrint('NotificationTapBackgroundHandler: Notification tapped: ${response.payload}');
}

Future<void> _initLocalNotification() async {
  // 新增android的settings
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'default_channel_id', // 這裡要與顯示通知時一致
    '預設頻道',
    importance: Importance.max,
  );
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
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
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveBackgroundNotificationResponse: _localNotificationTapBackgroundHandler,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      // 當應用程式在前台時，顯示通知點擊後(Data Message)
      debugPrint('onDidReceiveNotificationResponse: ${response.payload}');
      // 在此處處理通知點擊事件
    },
  );
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
        home: const ContainerTest1());
  }
}
