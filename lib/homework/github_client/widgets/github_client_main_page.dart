import 'package:flutter/material.dart';
import 'package:flutter_practice/homework/github_client/models/user.dart';
import 'package:flutter_practice/homework/github_client/widgets/github_client_repository_list.dart';
import 'package:go_router/go_router.dart';

part 'github_client_main_page.g.dart';

@TypedGoRoute<MainRoute>(path: GithubClientMainPage.ROUTE_NAME)
class MainRoute extends GoRouteData with _$MainRoute {
  final User? $extra;

  const MainRoute({this.$extra});

  @override
  Widget build(BuildContext context, GoRouterState state) => GithubClientMainPage(user: $extra);
}

class GithubClientMainPage extends StatefulWidget {
  static const String ROUTE_NAME = "/main";

  final User? user;

  const GithubClientMainPage({super.key, this.user});

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
          children: <Widget>[
            // RepositoryListRoute 需要 id 和 name，這裡先傳入預設值
            // 實際應用中，您會從登入頁面傳遞這些資訊
            GithubClientRepositoryList(
                id: widget.user?.id ?? 0,
                name: widget.user?.login ?? "Unknown User",
                user: widget.user),
            const Center(child: Text("Notifications Page")),
            const Center(child: Text("Profile Page")),
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
