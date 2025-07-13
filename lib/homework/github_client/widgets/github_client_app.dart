import 'package:flutter/material.dart';

import '../routes/router_config.dart';

class GithubClientApp extends StatelessWidget {
  const GithubClientApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(title: 'GithubClientApp', routerConfig: globalRouteConfig);
  }
}
