/*
 * 這個檔案定義了 FavorsList 和 FavorCardItem 兩個 StatelessWidget。
 * FavorsList 用於顯示一個包含多個 FavorCardItem 的列表，每個 FavorCardItem 代表一個 "favor"（請求或任務）。
 * FavorCardItem 則負責顯示單個 "favor" 的詳細資訊，包括請求者的頭像、描述以及根據 "favor" 狀態顯示不同的操作按鈕（例如：接受、拒絕、完成、放棄）。
 */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'favor.dart';
import 'favors_page.dart';

class FavorsList extends StatelessWidget {

  final String _title;
  final List<Favor> _favors;

  const FavorsList({
    super.key,
    required String title,
    required List<Favor> favors,
  })
      : _title = title,
        _favors = favors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: ListView.builder(
          itemCount: _favors.length,
          itemBuilder: (BuildContext context, int index) {
            final Favor favor = _favors[index];

            return FavorCardItem(favor: favor);
          },
        ));
  }
}


class FavorCardItem extends StatelessWidget {

  final Favor _favor;

  const FavorCardItem({
    super.key,
    required Favor favor
  }) : _favor = favor;

  @override
  Widget build(BuildContext context) {
    return Card(
        key: ValueKey(_favor.uuid),
        margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              _itemHeader(_favor),
              Text(_favor.description),
              _itemFooter(context, _favor),
            ]
          ),
        )
    );
  }

  Widget _itemFooter(BuildContext context, Favor favor) {
    if (favor.isCompleted) {
      final format = DateFormat("yyyy-MM-dd HH:mm");

      return Container(
        margin: const EdgeInsets.only(top: 8.0),
        alignment: Alignment.centerRight,
        child: Chip(
          label: Text("Completed at: ${format.format(favor.completed ?? DateTime.now())}"),
        ),
      );
    }
    if (favor.isRequested) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          ElevatedButton(
            child: const Text("Refuse"),
            onPressed: () {
              FavorsPageState.of(context)?.refuseToDo(favor);
            },
          ),
          ElevatedButton(
            child: const Text("Do"),
            onPressed: () {
              FavorsPageState.of(context)?.acceptToDo(favor);
            },
          )
        ],
      );
    }
    if (favor.isDoing) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          ElevatedButton(
            child: const Text("give up"),
            onPressed: () {
              FavorsPageState.of(context)?.giveUp(favor);
            },
          ),
          ElevatedButton(
            child: const Text("complete"),
            onPressed: () {
              FavorsPageState.of(context)?.complete(favor);
            },
          )
        ],
      );
    }

    return Container();
  }

  Widget _itemHeader(Favor favor) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(favor.friend.photoURL),
          radius: 20.0,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text("${favor.friend.name} asked you to... "),
          ),
        )
      ],
    );
  }
}

