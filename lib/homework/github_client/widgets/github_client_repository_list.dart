import 'package:flutter/material.dart';
import 'package:flutter_practice/homework/github_client/models/repo.dart';
import 'package:go_router/go_router.dart';
import 'package:toast/toast.dart';

import '../api/github_api_manager.dart';
import '../models/user.dart';
import 'repo_item.dart';

class GithubClientRepositoryList extends StatefulWidget {
  static const String ROUTE_NAME = "/repository_list";

  const GithubClientRepositoryList({super.key});

  @override
  State<GithubClientRepositoryList> createState() => _GithubClientRepositoryListState();
}

class _GithubClientRepositoryListState extends State<GithubClientRepositoryList> {
  Future<List<Repo>?> _fetchRepos() async {
    return await GithubApiManager.instance.getRepos();
  }

  @override
  Widget build(BuildContext context) {
    var user = GoRouterState.of(context).extra as User?;
    if (user != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Toast.show("User is ${user.name}, id is ${user.name}");
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("GithubClientRepositoryList"),
      ),
      body: FutureBuilder<List<Repo>?>(
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
          }),
    );
  }
}
