import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_practice/bloc/login/model/user.dart';
import '../repository/authentication_repository.dart';
import '../repository/user_repository.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  late StreamSubscription<AuthenticationStatus> _authenticationStatusSubscription;

  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository,
      required UserRepository userRepository})
      : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(_authenticationEventHandler);
    on<AuthenticationLogoutRequested>(_authenticationLogoutEventHandler);
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
          (status) => add(AuthenticationStatusChanged(status)),
    );
  }

  Future<void> _authenticationEventHandler(AuthenticationStatusChanged event, Emitter<AuthenticationState> emit) async {
    AuthenticationStatus authStatus = event.status;

    switch(authStatus) {
      case AuthenticationStatus.unknown:
        emit(const AuthenticationState.unknown());
        break;

      case AuthenticationStatus.authenticated:
        final user = await _tryGetUser();
        emit(user != null ? AuthenticationState.authenticated(user) : const AuthenticationState.unauthenticated());
        break;

      case AuthenticationStatus.unauthenticated:
        emit(const AuthenticationState.unauthenticated());
        break;
    }
  }

  FutureOr<void> _authenticationLogoutEventHandler(AuthenticationLogoutRequested event, Emitter<AuthenticationState> emit) {
    _authenticationRepository.logOut();
  }

  Future<User?> _tryGetUser() async {
    try {
      final user = await _userRepository.getUser();
      return user;
    } catch (_) {
      return null;
    }
  }


  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    return super.close();
  }
}
