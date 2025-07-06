// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_client_main_page.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainRoute,
    ];

RouteBase get $mainRoute => GoRouteData.$route(
      path: '/main',
      factory: _$MainRoute._fromState,
    );

mixin _$MainRoute on GoRouteData {
  static MainRoute _fromState(GoRouterState state) => MainRoute(
        $extra: state.extra as User?,
      );

  MainRoute get _self => this as MainRoute;

  @override
  String get location => GoRouteData.$location(
        '/main',
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
