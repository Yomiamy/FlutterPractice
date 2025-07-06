import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'github_client_repository_detail_page.g.dart';

@TypedGoRoute<RepositoryDetailRoute>(path: GithubClientRepositoryDetailPage.ROUTE_NAME)
class RepositoryDetailRoute extends GoRouteData with _$RepositoryDetailRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const GithubClientRepositoryDetailPage();
}

class GithubClientRepositoryDetailPage extends StatelessWidget {
  static const String ROUTE_NAME = "/detail";

  const GithubClientRepositoryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: const Center(
            child: Text('GithubClientRepositoryDetailPage', style: TextStyle(fontSize: 24))));
  }
}
