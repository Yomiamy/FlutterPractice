part of '../routes/router_config.dart';

class RepositoryDetailRoute extends GoRouteData with _$RepositoryDetailRoute {
  static const String ROUTE_NAME = "/detail";

  const RepositoryDetailRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const GithubClientRepositoryDetailPage();
}

class GithubClientRepositoryDetailPage extends StatelessWidget {
  const GithubClientRepositoryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: const Center(
            child: Text('GithubClientRepositoryDetailPage', style: TextStyle(fontSize: 24))));
  }
}
