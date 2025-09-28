// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router_config.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $loginRoute,
      $mainShellRoute,
    ];

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/',
      factory: _$LoginRoute._fromState,
    );

mixin _$LoginRoute on GoRouteData {
  static LoginRoute _fromState(GoRouterState state) => const LoginRoute();

  @override
  String get location => GoRouteData.$location(
        '/',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $mainShellRoute => ShellRouteData.$route(
      navigatorKey: MainShellRoute.$navigatorKey,
      factory: $MainShellRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/repository_list',
          factory: _$RepositoryListRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'users',
              factory: _$UsersRouteData._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'user/:id',
                  parentNavigatorKey: UserRouteData.$parentNavigatorKey,
                  factory: _$UserRouteData._fromState,
                ),
              ],
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/ai_list',
          factory: _$GithubClientAiChatRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: '/detail',
              factory: _$RepositoryDetailRoute._fromState,
            ),
          ],
        ),
      ],
    );

extension $MainShellRouteExtension on MainShellRoute {
  static MainShellRoute _fromState(GoRouterState state) =>
      const MainShellRoute();
}

mixin _$RepositoryListRoute on GoRouteData {
  static RepositoryListRoute _fromState(GoRouterState state) =>
      const RepositoryListRoute();

  @override
  String get location => GoRouteData.$location(
        '/repository_list',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$UsersRouteData on GoRouteData {
  static UsersRouteData _fromState(GoRouterState state) =>
      const UsersRouteData();

  @override
  String get location => GoRouteData.$location(
        '/repository_list/users',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$UserRouteData on GoRouteData {
  static UserRouteData _fromState(GoRouterState state) => UserRouteData(
        id: int.parse(state.pathParameters['id']!)!,
      );

  UserRouteData get _self => this as UserRouteData;

  @override
  String get location => GoRouteData.$location(
        '/repository_list/users/user/${Uri.encodeComponent(_self.id.toString())}',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$GithubClientAiChatRoute on GoRouteData {
  static GithubClientAiChatRoute _fromState(GoRouterState state) =>
      const GithubClientAiChatRoute();

  @override
  String get location => GoRouteData.$location(
        '/ai_list',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin _$RepositoryDetailRoute on GoRouteData {
  static RepositoryDetailRoute _fromState(GoRouterState state) =>
      const RepositoryDetailRoute();

  @override
  String get location => GoRouteData.$location(
        '/detail',
      );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
