part of '../routes/router_config.dart';

@TypedGoRoute<LoginRoute>(path: GithubClientLogin.ROUTE_NAME)
class LoginRoute extends GoRouteData with _$LoginRoute {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const GithubClientLogin();
}

class GithubClientLogin extends StatefulWidget {
  static const String ROUTE_NAME = "/";

  const GithubClientLogin({super.key});

  @override
  State<GithubClientLogin> createState() => _GithubClientLoginState();
}

class _GithubClientLoginState extends State<GithubClientLogin> {
  final _loginFormKey = GlobalKey<FormState>();
  String _account = "";
  Future<User?>? _loginFuture;

  Future<void> _login(String account) async {
    if (account.isEmpty) {
      setState(() {
        _loginFuture = null;
      });
      return;
    }
    setState(() {
      _loginFuture = GithubApiManager.instance.login(account: account, passwd: "");
    });
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("GithubClientLogin"),
      ),
      body: FutureBuilder<User?>(
        future: _loginFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              // 修改跳轉邏輯，跳轉到 GithubClientMainPage
              RepositoryListRoute($extra: snapshot.data).push<void>(context);
            });
          } else if (snapshot.hasError && _loginFuture != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              String errorMsg = "Login failed";

              if (snapshot.error is DioException) {
                var response = (snapshot.error as DioException).response;
                errorMsg = "Login failed: ${response?.statusMessage ?? "Network error"}";
              } else if (snapshot.error is Exception) {
                errorMsg = "Login failed: ${snapshot.error}";
              }
              Toast.show(errorMsg);
            });
          }
          return Form(
            key: _loginFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                        errorStyle: TextStyle(fontSize: 0.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: 'Github Account Name',
                        hintText: "Please input github account name",
                        prefixIcon: Icon(Icons.person)),
                    validator: (str) {
                      if (str == null || str.isEmpty) {
                        return "";
                      }
                      return null;
                    },
                    onChanged: (str) {
                      _account = str;
                    },
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_loginFormKey.currentState?.validate() ?? false) {
                          _login(_account);
                        } else {
                          Toast.show("Please input github account name");
                        }
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Visibility(
                    visible: snapshot.connectionState == ConnectionState.waiting,
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                        strokeWidth: 5.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
