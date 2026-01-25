import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class GeneralDialogTest1 extends StatefulWidget {
  const GeneralDialogTest1({super.key});

  @override
  State<GeneralDialogTest1> createState() => _GeneralDialogTest1State();
}

class _GeneralDialogTest1State extends State<GeneralDialogTest1> {
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("GeneralDialogTest1"),
        ),
        body: ElevatedButton(
            onPressed: () async {
              bool isDeleted = await showCustomerDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return AlertDialog(
                        title: const Text('提示'),
                        content: const Text('是否要刪除當前資料?'),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: const Text('確定')),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: const Text('取消'))
                        ]
                    );
                  });

              if (isDeleted) {
                Toast.show('刪除成功');
              } else {
                Toast.show('取消刪除');
              }
            },
            child: const Text('Show Dialog')));
  }

  Future<T?> showCustomerDialog<T>({
    required BuildContext context,
    bool barrierDismissible = true,
    required WidgetBuilder builder
  }) async {
    final ThemeData theme = Theme.of(context);
    return showGeneralDialog(
        context: context,
        pageBuilder: (context, animation, secondaryAnimation) {
          final Widget pageChild = Builder(builder: builder);
          return SafeArea(child: Builder(builder: (context) {
            return Theme(
              data: theme,
              child: pageChild,
            );
          }));
        },
        barrierDismissible: barrierDismissible,
        barrierLabel: MaterialLocalizations
            .of(context)
            .modalBarrierDismissLabel,
        barrierColor: Colors.black87,
        transitionDuration: const Duration(microseconds: 100),
        transitionBuilder:_buildMaterialDialogTransitions,
    );
  }

  Widget _buildMaterialDialogTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return ScaleTransition(
      scale: CurvedAnimation(parent: animation, curve: Curves.easeOut),
      child: child
    );
  }
}
