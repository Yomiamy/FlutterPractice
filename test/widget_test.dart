// 基本的 Flutter widget 冒煙測試。
//
// 驗證 App 根節點 MyApp 能正常啟動，並渲染出首頁 LifecycleMonitor 畫面。
// （App 首頁已由預設的計數器範本改為 LifecycleMonitor，故測試對應實際首頁。）

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_practice/main.dart';

void main() {
  testWidgets('App 啟動並顯示 LifecycleMonitor 首頁', (WidgetTester tester) async {
    // 建立 App 並觸發一次 frame。
    await tester.pumpWidget(const MyApp());
    // 等待本地化等非同步資源載入完成。
    await tester.pumpAndSettle();

    // 驗證首頁 LifecycleMonitor 的標題與內容文字皆已渲染。
    expect(find.text('LifecycleMonitor'), findsWidgets);
  });
}
