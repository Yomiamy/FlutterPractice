import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/homework/github_client/bloc/gemini_api_event.dart';
import 'package:go_router/go_router.dart';
import 'package:toast/toast.dart';

import '../api/github_api_manager.dart';
import '../bloc/gemini_api_bloc.dart';
import '../bloc/gemini_api_state.dart';
import '../bloc/status.dart';
import '../common/Global.dart';
import '../models/repo.dart';
import '../models/user.dart';
import '../widgets/repo_item.dart';

part '../widgets/dialog_page.dart';
part '../widgets/github_client_ai_chat_page.dart';
part '../widgets/github_client_login.dart';
part '../widgets/github_client_main_page.dart';
part '../widgets/github_client_repository_detail_page.dart';
part '../widgets/github_client_repository_list.dart';
part '../widgets/user_route_data.dart';
part 'router_config.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

// [$loginRoute, $mainShellRoute]
final globalRouteConfig = GoRouter(navigatorKey: rootNavigatorKey, routes: $appRoutes);
