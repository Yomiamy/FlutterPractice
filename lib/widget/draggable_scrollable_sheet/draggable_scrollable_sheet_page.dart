import 'package:flutter/material.dart';

class DraggableScrollableSheetPage extends StatefulWidget {
  const DraggableScrollableSheetPage({super.key});

  @override
  State<DraggableScrollableSheetPage> createState() =>
      _DraggableScrollableSheetPageState();
}

class _DraggableScrollableSheetPageState
    extends State<DraggableScrollableSheetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
            title: const Text('詳情'),
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary),
        body: Stack(
          children: [
            DraggableScrollableSheet(
                initialChildSize: 0.1,
                minChildSize: 0.1,
                maxChildSize: 0.4,
                builder: (context, scrollController) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12)
                      )
                    ),
                    child: buildListView(scrollController),
                  );
                }
            )
          ]
        ));
  }

  buildListView(ScrollController scrollController) => ListView.builder(
      controller: scrollController,
      itemCount: 20,
      itemBuilder: (context, index) => ListTile(title: Text("Item $index"))
  );
}
