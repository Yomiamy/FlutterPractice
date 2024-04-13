import 'package:flutter_practice/bloc/login/repository/authentication_repository.dart';

sealed class AuthenticationEvent {
  const AuthenticationEvent();
}

final class AuthenticationStatusChanged extends AuthenticationEvent {
  final AuthenticationStatus status;

  const AuthenticationStatusChanged(this.status);
}

final class AuthenticationLogoutRequested extends AuthenticationEvent {}