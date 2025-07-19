part of '../routes/router_config.dart';

class GithubClientAiChatRoute extends GoRouteData with _$GithubClientAiChatRoute {
  static const String ROUTE_NAME = "/ai_list";

  const GithubClientAiChatRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const GithubClientAiChatPage();
}

class GithubClientAiChatPage extends StatelessWidget {
  const GithubClientAiChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text('Repository Detail Item $index',
                          style: const TextStyle(fontSize: 24)));
                })));
  }
}
