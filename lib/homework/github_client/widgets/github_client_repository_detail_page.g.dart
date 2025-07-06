// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_client_repository_detail_page.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $repositoryDetailRoute,
    ];

RouteBase get $repositoryDetailRoute => GoRouteData.$route(
      path: '/detail',
      factory: _$RepositoryDetailRoute._fromState,
    );

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
