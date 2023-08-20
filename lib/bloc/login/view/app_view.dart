import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/bloc/login/bloc/authentication_bloc.dart';
import 'package:flutter_practice/bloc/login/bloc/authentication_state.dart';
import 'package:flutter_practice/bloc/login/repository/authentication_repository.dart';
import 'package:flutter_practice/bloc/login/view/home_page.dart';
import 'package:flutter_practice/bloc/login/view/login_page.dart';
import 'splash_page.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) => MaterialApp(
        navigatorKey: _navigatorKey,
        builder: (context, child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                switch (state.status) {
                  case AuthenticationStatus.authenticated:
                    _navigator.pushAndRemoveUntil<void>(
                      HomePage.route(),
                      (route) => false,
                    );
                  case AuthenticationStatus.unauthenticated:
                    _navigator.pushAndRemoveUntil<void>(
                      LoginPage.route(),
                      (route) => false,
                    );
                  case AuthenticationStatus.unknown:
                    break;
                }
              },
              child: child);
        },
        onGenerateRoute: (_) => SplashPage.route(),
      );
}
