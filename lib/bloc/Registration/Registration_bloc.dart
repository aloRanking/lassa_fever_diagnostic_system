import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Authentication/Authentication_bloc.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Login/Login_bloc.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Registration/index.dart';
import 'package:lassafeverdiagnosticsystem/repository/user_repository.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {

final UserRepository userRepository;
final AuthenticationBloc authenticationBloc;

  RegistrationBloc({@required this.userRepository, this.authenticationBloc}): assert(userRepository != null);

  @override
  RegistrationState get initialState => UnRegistrationState();

  @override
  Stream<RegistrationState> mapEventToState(
    RegistrationEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'RegistrationBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
