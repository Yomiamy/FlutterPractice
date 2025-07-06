import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/github_client_login.dart';
import '../widgets/github_client_main_page.dart';
import '../widgets/github_client_repository_detail_page.dart';
import '../widgets/github_client_repository_list.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

// [$loginRoute, $mainShellRoute]
final globalRouteConfig = GoRouter(
    navigatorKey: rootNavigatorKey,
    routes: [$loginRoute, $mainShellRoute, $repositoryListRoute, $repositoryDetailRoute]);
