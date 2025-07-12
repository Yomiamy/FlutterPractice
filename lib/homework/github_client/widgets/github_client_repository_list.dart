part of '../routes/router_config.dart';

class RepositoryListRoute extends GoRouteData with _$RepositoryListRoute {
  const RepositoryListRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: const Duration(seconds: 1), // 指定 transition 的 duration
        child: const GithubClientRepositoryList(), // 使用 id 和 name
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // Start from the right, // End at the center
          // Use a curve for smooth transition
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
                .animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            )),
            child: child,
          );
        });
  }
}

class GithubClientRepositoryList extends StatefulWidget {
  //static const String ROUTE_NAME = "/repository_list/:id/:name";
  static const String ROUTE_NAME = "/repository_list";

  const GithubClientRepositoryList({super.key});

  @override
  State<GithubClientRepositoryList> createState() => _GithubClientRepositoryListState();
}

class _GithubClientRepositoryListState extends State<GithubClientRepositoryList> {
  User? _user;

  @override
  void initState() {
    super.initState();

    _user = Global.instance.user;
  }

  Future<List<Repo>?> _fetchRepos() async {
    return await GithubApiManager.instance.getRepos();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Toast.show("_user.login = ${_user?.login}, _user.id = ${_user?.id}");
    });

    return FutureBuilder<List<Repo>?>(
        future: _fetchRepos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            List<Repo> repos = snapshot.data ?? [];

            return ListView.builder(
              itemCount: repos.length,
              itemBuilder: (context, index) {
                return RepoItem(repo: repos[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          return const Center(child: CircularProgressIndicator());
        });
  }
}
