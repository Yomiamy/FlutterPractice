import 'package:go_router/go_router.dart';

import '../widgets/github_client_login.dart';
import '../widgets/github_client_main_page.dart';
import '../widgets/github_client_repository_list.dart';

final globalRouteConfig = GoRouter(routes: [
  $loginRoute,
  $mainRoute,
  $repositoryListRoute,
]);
