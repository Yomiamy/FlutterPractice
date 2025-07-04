import 'package:go_router/go_router.dart';

import '../widgets/github_client_login.dart';
import '../widgets/github_client_repository_list.dart';

final globalRouteConfig = GoRouter(initialLocation: GithubClientLogin.ROUTE_NAME, routes: [
  GoRoute(path: GithubClientLogin.ROUTE_NAME, builder: (_, __) => const GithubClientLogin()),
  GoRoute(
      path: GithubClientRepositoryList.ROUTE_NAME,
      builder: (_, __) => const GithubClientRepositoryList())
]);
