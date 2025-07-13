part of '../routes/router_config.dart';

final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

// TypedGoRoute的第二層開始的TypedGoRoute不能以'/'開頭
@TypedShellRoute<MainShellRoute>(routes: [
  TypedGoRoute<RepositoryListRoute>(path: RepositoryListRoute.ROUTE_NAME, routes: [
    TypedGoRoute<UsersRouteData>(
        path: UsersRouteData.ROUTE_NAME,
        routes: <TypedGoRoute<UserRouteData>>[
          TypedGoRoute<UserRouteData>(path: UserRouteData.ROUTE_NAME)
        ])
  ]),
  TypedGoRoute<RepositoryDetailRoute>(path: RepositoryDetailRoute.ROUTE_NAME)
])
class MainShellRoute extends ShellRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  const MainShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) =>
      GithubClientMainPage(child: navigator);
}

class GithubClientMainPage extends StatefulWidget {
  static const String ROUTE_NAME = "/main";

  final Widget child;

  const GithubClientMainPage({super.key, required this.child});

  @override
  State<GithubClientMainPage> createState() => _GithubClientMainPageState();
}

class _GithubClientMainPageState extends State<GithubClientMainPage> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("GithubClientMainPage"),
        ),
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.code),
              label: 'Repositories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ));
  }

  void _onItemTapped(int index) {
    _selectedIndex = index;

    switch (index) {
      case 0:
        const RepositoryListRoute().go(context);
        break;
      case 1:
        const RepositoryDetailRoute().go(context);
        break;
    }
  }
}

class UsersRouteData extends GoRouteData with _$UsersRouteData {
  static const String ROUTE_NAME = "users";

  const UsersRouteData();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ListView(
      children: <Widget>[
        for (int userID = 1; userID <= 3; userID++)
          ListTile(
            title: Text('User $userID'),
            onTap: () => UserRouteData(id: userID).go(context),
          ),
      ],
    );
  }
}

class UserRouteData extends GoRouteData with _$UserRouteData {
  static const String ROUTE_NAME = "user/:id";

  const UserRouteData({required this.id});

  // Without this static key, the dialog will not cover the navigation rail.
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  final int id;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return DialogPage(
      key: state.pageKey,
      child: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Card(child: Center(child: Text('User $id'))),
        ),
      ),
    );
  }
}

class DialogPage extends Page<void> {
  /// A page to display a dialog.
  const DialogPage({required this.child, super.key});

  /// The widget to be displayed which is usually a [Dialog] widget.
  final Widget child;

  @override
  Route<void> createRoute(BuildContext context) {
    return DialogRoute<void>(
      context: context,
      settings: this,
      builder: (BuildContext context) => child,
    );
  }
}
