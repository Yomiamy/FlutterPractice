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
        id: int.parse(state.uri.queryParameters['id']!)!,
        name: state.uri.queryParameters['name']!,
      );

  RepositoryListRoute get _self => this as RepositoryListRoute;

  @override
  String get location => GoRouteData.$location(
        '/repository_list',
        queryParams: {
          'id': _self.id.toString(),
          'name': _self.name,
        },
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
