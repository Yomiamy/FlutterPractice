import 'package:flutter/material.dart';
import 'package:flutter_practice/homework/github_client/models/repo.dart';
import 'package:go_router/go_router.dart';
import 'package:toast/toast.dart';

import '../api/github_api_manager.dart';
import '../models/user.dart';
import 'repo_item.dart';

part 'github_client_repository_list.g.dart';

// 定义仓库列表页面的路由数据类
@TypedGoRoute<RepositoryListRoute>(path: GithubClientRepositoryList.ROUTE_NAME)
class RepositoryListRoute extends GoRouteData with _$RepositoryListRoute {
  // 用在route path 中的参数,不能是_前缀開頭, 不然go_router 會無法解析
  final int id; // 將 _id 改為 id
  final String name; // 將 _name 改為 name
  final User? $extra;

  const RepositoryListRoute(
      {required this.id, required this.name, this.$extra}); // 直接初始化，不再使用 _id 和 _name

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: const Duration(seconds: 1), // 指定 transition 的 duration
        child: GithubClientRepositoryList(id: id, name: name, user: $extra), // 使用 id 和 name
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Start from the right, // End at the center
          // Use a curve for smooth transition
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
                .animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            )),
            child: child,
          );
        });
  }
}

class GithubClientRepositoryList extends StatefulWidget {
  //static const String ROUTE_NAME = "/repository_list/:id/:name";
  static const String ROUTE_NAME = "/repository_list";

  final int _id;
  final String _name;
  final User? _user;

  const GithubClientRepositoryList({super.key, required int id, required String name, User? user})
      : _id = id,
        _name = name,
        _user = user;

  @override
  State<GithubClientRepositoryList> createState() => _GithubClientRepositoryListState();
}

class _GithubClientRepositoryListState extends State<GithubClientRepositoryList> {
  Future<List<Repo>?> _fetchRepos() async {
    return await GithubApiManager.instance.getRepos();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Toast.show("""
      _name = ${widget._name}, _id = ${widget._id}
      _user.login = ${widget._user?.login}, _user.id = ${widget._user?.id}
      """);
    });

    return FutureBuilder<List<Repo>?>(
        future: _fetchRepos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            List<Repo> repos = snapshot.data ?? [];

            return ListView.builder(
              itemCount: repos.length,
              itemBuilder: (context, index) {
                return RepoItem(repo: repos[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          return const Center(child: CircularProgressIndicator());
        });
  }
}
