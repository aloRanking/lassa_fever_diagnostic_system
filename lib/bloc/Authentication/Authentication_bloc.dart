import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lassafeverdiagnosticsystem/repository/user_repository.dart';

import 'index.dart';


class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  @override
  AuthenticationState get initialState => AuthenticationInitial();

 final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository}): assert(userRepository != null);

  

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'AuthenticationBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
