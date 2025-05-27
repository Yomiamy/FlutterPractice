import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

class WillPopScopeTest1 extends StatelessWidget {
  const WillPopScopeTest1({super.key});

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('WillPopScopeTest1'),
        ),
        body: PopScope(
          child: Column(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).customPop();
                },
                child: const Text('返回'),
              )
            ],
          ),
          onPopInvokedWithResult: (didPop, result) {
            Toast.show("返回點擊");
          } ,
        )
    );
  }
}



// 定义一个方便扩展功能的 extension 示例
extension NavigatorExtension on NavigatorState {
  void customPop() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      SystemNavigator.pop();
    }
  }
}
