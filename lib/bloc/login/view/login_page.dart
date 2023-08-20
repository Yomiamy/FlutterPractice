import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/bloc/login/bloc/login_bloc.dart';
import 'package:flutter_practice/bloc/login/repository/authentication_repository.dart';

import 'login_form.dart';

class LoginPage extends StatelessWidget {

  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: const Padding(
        padding: EdgeInsets.all(12),
        child: LoginForm()
      ),
    );
  }
}