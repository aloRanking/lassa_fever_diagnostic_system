import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Authentication/index.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Login/index.dart';
import 'package:lassafeverdiagnosticsystem/repository/user_repository.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => UnLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoginBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
