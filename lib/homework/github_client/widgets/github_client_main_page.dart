part of '../routes/router_config.dart';

final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

@TypedShellRoute<MainShellRoute>(routes: [
  TypedGoRoute<RepositoryListRoute>(path: GithubClientRepositoryList.ROUTE_NAME, routes: [
    TypedGoRoute<RepositoryDetailRoute>(path: GithubClientRepositoryDetailPage.ROUTE_NAME)
  ]),
])
class MainShellRoute extends ShellRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  const MainShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) =>
      const GithubClientMainPage();
}

class GithubClientMainPage extends StatefulWidget {
  static const String ROUTE_NAME = "/main";

  const GithubClientMainPage({super.key});

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
          title: const Text("Github Client"),
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: const <Widget>[
            // RepositoryListRoute 需要 id 和 name，這裡先傳入預設值
            // 實際應用中，您會從登入頁面傳遞這些資訊
            GithubClientRepositoryList(),
            Center(child: Text("Notifications Page")),
            Center(child: Text("Profile Page")),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.code),
              label: 'Repositories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
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
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }
}
