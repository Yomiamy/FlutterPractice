import 'package:equatable/equatable.dart';

import '../model/user.dart';
import '../repository/authentication_repository.dart';

class AuthenticationState extends Equatable {

  final AuthenticationStatus status;
  final User user;

  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = const User.empty()
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(User user) : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated() : this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object?> get props => [status, user];
}
