import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'authentication_bloc.dart';
import '../repository/authentication_repository.dart';
import '../repository/user_repository.dart';

class AuthenticationPage extends StatelessWidget {

  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthenticationBloc(
          authenticationRepository: AuthenticationRepository(),
          userRepository: UserRepository()
      ),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<AuthenticationBloc>(context);

    return Container();
  }
}

