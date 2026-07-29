import 'package:drag_container/drag/drag_container.dart';
import 'package:drag_container/drag/drag_controller.dart';
import 'package:flutter/material.dart';

class BottomDragTabWidget extends StatefulWidget {
  const BottomDragTabWidget({super.key});

  @override
  State<BottomDragTabWidget> createState() => _BottomDragTabWidgetState();
}

class _BottomDragTabWidgetState extends State<BottomDragTabWidget> with TickerProviderStateMixin {

  ScrollController scrollController = ScrollController();
  DragController dragController = DragController();
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    tabController.addListener(() {
      if(tabController.index.toDouble() == tabController.animation?.value) {
        debugPrint("切換 ${tabController.index}");
        dragController.open();
      }
    });
  }

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
          maxChildRate: 0.8,
          isShowHeader: true,
          backGroundColor: Colors.white,
          cornerRadius: 12,
          maxOffsetDistance: 1.5,
          controller: dragController,
          scrollController: scrollController,
          duration: const Duration(milliseconds: 400),
          dragWidget: buildDragContentView(),
          dragCallBack: (isOpen) {},
        ),
      );

  Widget buildDragContentView() => Column(
    children: [
      TabBar(
          labelColor: Colors.grey,
          controller: tabController,
          tabs: const [
            Tab(text: "評價"),
            Tab(text: "推薦"),
            Tab(text: "其它")
          ]
      ),
      // 分隔線
      Container(color: Colors.grey[200], height: 1.0),
      Expanded(child: TabBarView(
        controller: tabController,
        children: const [
          ItemPage(index: 1),
          ItemPage(index: 2),
          ItemPage(index: 3)
        ]
      ))
    ],
  );
}

class ItemPage extends StatelessWidget {
  final int index;

  const ItemPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) => Center(
    child: Text("Page $index")
  );
}

