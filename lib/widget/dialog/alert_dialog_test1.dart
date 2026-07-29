import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class AlertDialogTest1 extends StatelessWidget {
  const AlertDialogTest1({super.key});

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('AlertDialogTest1'),
        ),
        body: ElevatedButton(
            onPressed: () async {
              bool isDeleted = await showDialog(
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
}
