import 'package:drag_container/drag/drag_container.dart';
import 'package:drag_container/drag/drag_controller.dart';
import 'package:flutter/material.dart';

class BottomDragWidget extends StatefulWidget {
  const BottomDragWidget({super.key});

  @override
  State<BottomDragWidget> createState() => _BottomDragWidgetState();
}

class _BottomDragWidgetState extends State<BottomDragWidget> {

  ScrollController scrollController = ScrollController();
  DragController dragController = DragController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('抽屜效果'),
        ),
        backgroundColor: Colors.grey,
        body: Stack(
            children: <Widget>[
              buildDragWidget()
            ]
        ));
  }

  Widget buildDragWidget() =>
      Align(
        alignment: Alignment.bottomCenter,
        child: DragContainer(
          initChildRate: 0.1,
          maxChildRate: 0.4,
          isShowHeader: true,
          backGroundColor: Colors.white,
          cornerRadius: 12,
          maxOffsetDistance: 1.5,
          controller: dragController,
          scrollController: scrollController,
          duration: const Duration(milliseconds: 800),
          dragWidget: buildListView(),
          dragCallBack: (isOpen) {},
        ),
      );

  Widget buildListView() =>
      ListView.builder(
          controller: scrollController,
          itemCount: 20,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  debugPrint("單擊事件 $index");
                },
                child: ListTile(title: Text("測試數據$index"))
            );
          }
      );
}
