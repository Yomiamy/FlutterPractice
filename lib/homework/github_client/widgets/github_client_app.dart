import 'package:flutter/material.dart';
import 'package:flutter_practice/homework/github_client/widgets/github_client_login.dart';
import 'package:flutter_practice/homework/github_client/widgets/github_client_repository_list.dart';
import 'package:toast/toast.dart';

class GithubClientApp extends StatelessWidget {
  const GithubClientApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GithubClientApp',
        routes: <String, WidgetBuilder>{
          GithubClientLogin.ROUTE_NAME: (BuildContext context) => const GithubClientLogin(),
          GithubClientRepositoryList.ROUTE_NAME: (BuildContext context) => const GithubClientRepositoryList()
        });
  }
}
