import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:toast/toast.dart';

class InheritedWidgetTest1 extends StatefulWidget {
  const InheritedWidgetTest1({super.key});

  @override
  State<InheritedWidgetTest1> createState() => _InheritedWidgetTest1State();
}

class _InheritedWidgetTest1State extends State<InheritedWidgetTest1> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('InheritedWidgetTest1'),
        ),
        body: SharedDataWidget(
          data: count,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(padding: EdgeInsets.only(bottom: 20.0), child: _TestWidget()),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        ++count;
                      });
                    },
                    child: const Text('計數增加'),
                )
              ]),
        ));
  }
}

class SharedDataWidget extends InheritedWidget {
  final int data;

  const SharedDataWidget({super.key, required this.data, required super.child});

  static SharedDataWidget? of(BuildContext context) {
    // getElementForInheritedWidgetOfExactType不會註冊依賴關係
    //   return context.getElementForInheritedWidgetOfExactType<SharedDataWidget>()?.widget as SharedDataWidget?;
    return context.dependOnInheritedWidgetOfExactType<SharedDataWidget>();
  }

  @override
  bool updateShouldNotify(SharedDataWidget oldWidget) => oldWidget.data != data;
}

class _TestWidget extends StatefulWidget {
  const _TestWidget({super.key});

  @override
  State<_TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    // SharedDataWidget.of(context);
    return Text("Data is : ${SharedDataWidget.of(context)?.data.toString()}");
    // return Text("Data is : N/A");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Toast.show("共享資料已經變更為, ${SharedDataWidget.of(context)?.data}");
    });
  }
}

