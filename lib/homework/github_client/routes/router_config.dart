import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../widgets/github_client_login.dart';
import '../widgets/github_client_repository_list.dart';

final globalRouteConfig = GoRouter(initialLocation: GithubClientLogin.ROUTE_NAME, routes: [
  GoRoute(path: GithubClientLogin.ROUTE_NAME, builder: (_, __) => const GithubClientLogin()),
  GoRoute(
      path: GithubClientRepositoryList.ROUTE_NAME,
      pageBuilder: (_, state) => CustomTransitionPage(
          transitionDuration: const Duration(seconds: 1), // 指定 transition 的 duration
          key: state.pageKey,
          child: const GithubClientRepositoryList(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Start from the right, // End at the center
            // Use a curve for smooth transition
            return SlideTransition(
                position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
                    .animate(CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                )),
                child: child);
          }))
]);
