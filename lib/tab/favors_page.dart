/*
 * 這個檔案定義了一個名為 `FavorsPage` 的 StatefulWidget,
 * 它是一個顯示使用者請求和處理請求的頁面。
 * 此頁面包含四個標籤頁，分別顯示待處理、進行中、已完成和已拒絕的請求。
 */

import 'package:flutter/material.dart';
import 'package:flutter_practice/tab/mock_values.dart';
import 'package:flutter_practice/tab/request_favor_page.dart';

import 'favor.dart';
import 'favors_list.dart';

class FavorsPage extends StatefulWidget {
  const FavorsPage({super.key});

  @override
  State<FavorsPage> createState() => FavorsPageState();
}

class FavorsPageState extends State<FavorsPage> {

  final List<Favor> _pendingAnswerFavors = <Favor>[];
  final List<Favor> _acceptedFavors = <Favor>[];
  final List<Favor> _completedFavors = <Favor>[];
  final List<Favor> _refusedFavors = <Favor>[];

  static FavorsPageState? of(BuildContext context) {
    return context.findAncestorStateOfType<FavorsPageState>();
  }

  @override
  void initState() {
    super.initState();

    loadFavors();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: Scaffold(
          appBar: AppBar(
            title: const Text("FavorsPage"),
            bottom: TabBar(
              isScrollable: true,
              tabs: <Widget>[
                _buildCategoryTab("Requests"),
                _buildCategoryTab("Doing"),
                _buildCategoryTab("Completed"),
                _buildCategoryTab("Refused")
              ]
            )
          ),
          body: TabBarView(
              children: [
                FavorsList(title: "Pending Requests", favors: _pendingAnswerFavors),
                FavorsList(title: "Doing", favors: _acceptedFavors),
                FavorsList(title: "Completed", favors: _completedFavors),
                FavorsList(title: "Refused", favors: _refusedFavors),
              ]
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RequestFavorPage(
                    friends: mockFriends,
                  ),
                ),
              );
            },
            tooltip: 'Ask a favor',
            child: const Icon(Icons.add),
          )
      )
    );
  }

  Widget _buildCategoryTab(String title) => Tab(
    child: Text(title),
  );

  void loadFavors() {
    _pendingAnswerFavors.addAll(mockPendingFavors);
    _acceptedFavors.addAll(mockDoingFavors);
    _completedFavors.addAll(mockCompletedFavors);
    _refusedFavors.addAll(mockRefusedFavors);
  }

  void refuseToDo(Favor favor) {
    setState(() {
      _pendingAnswerFavors.remove(favor);

      _refusedFavors.add(favor.copyWith(accepted: false));
    });
  }

  void acceptToDo(Favor favor) {
    setState(() {
      _pendingAnswerFavors.remove(favor);

      _acceptedFavors.add(favor.copyWith(accepted: true));
    });
  }

  void giveUp(Favor favor) {
    setState(() {
      _acceptedFavors.remove(favor);

      _refusedFavors.add(favor.copyWith(accepted: false,));
    });
  }

  void complete(Favor favor) {
    setState(() {
      _acceptedFavors.remove(favor);

      _completedFavors.add(favor.copyWith(completed: DateTime.now()));
    });
  }
}