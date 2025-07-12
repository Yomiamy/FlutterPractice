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
      RepositoryListRoute(
        $extra: state.extra as User?,
      );

  RepositoryListRoute get _self => this as RepositoryListRoute;

  @override
  String get location => GoRouteData.$location(
        '/repository_list',
      );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

mixin _$RepositoryDetailRoute on GoRouteData {
  static RepositoryDetailRoute _fromState(GoRouterState state) =>
      RepositoryDetailRoute();

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
