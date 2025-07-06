// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_client_repository_list.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $repositoryListRoute,
    ];

RouteBase get $repositoryListRoute => GoRouteData.$route(
      path: '/repository_list',
      factory: _$RepositoryListRoute._fromState,
    );

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
