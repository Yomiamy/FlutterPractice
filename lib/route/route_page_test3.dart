/*
 * 這個檔案是 Flutter 練習專案的一部分。
 *
 * 這個檔案定義了一個名為 RoutePageTest3 的 StatefulWidget，
 * 它展示了如何在 Flutter 中使用 Navigator 元件來處理路由。
 * RoutePageTest3 會在建構時自動導航到 RoutePageTest1 頁面。
 * 這有助於理解 Flutter 中頁面導航的基本概念和 Navigator 的用法。
 */

import 'package:flutter/material.dart';
import 'package:flutter_practice/route/route_page_test1.dart';

class RoutePageTest3 extends StatefulWidget {
  const RoutePageTest3({super.key});

  @override
  State<RoutePageTest3> createState() => _RoutePageTest3State();
}

class _RoutePageTest3State extends State<RoutePageTest3> with WidgetsBindingObserver {

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    // 在此註冊WidgetBindingObserver
    WidgetsBinding.instance.addObserver(this);
  }


  @override
  Future<bool> didPopRoute() => Future.value(_navigatorKey.currentState?.maybePop());

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: _navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) => const RoutePageTest1()
          );
        }
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}