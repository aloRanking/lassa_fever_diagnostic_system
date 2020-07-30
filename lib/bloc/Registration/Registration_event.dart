import 'dart:async';
import 'dart:developer' as developer;

import 'package:lassafeverdiagnosticsystem/bloc/Authentication/Authentication_event.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Authentication/Authentication_state.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Login/index.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Registration/index.dart';
import 'package:lassafeverdiagnosticsystem/models/register_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RegistrationEvent {
  Stream<RegistrationState> applyAsync(
      {RegistrationState currentState, RegistrationBloc bloc});
}

class UnRegistrationEvent extends RegistrationEvent {
  @override
  Stream<RegistrationState> applyAsync({RegistrationState currentState, RegistrationBloc bloc}) async* {
    yield UnRegistrationState();
  }
}

class RegistrationInEvent extends RegistrationEvent {
   
  @override
  Stream<RegistrationState> applyAsync(
      {RegistrationState currentState, RegistrationBloc bloc}) async* {
    try {
      yield UnRegistrationState();
      await Future.delayed(Duration(seconds: 1));
      yield RegistrationSuccessState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadLoginEvent', error: _, stackTrace: stackTrace);
      yield ErrorRegistrationState( _?.toString());
    }
  }
}

class RegistrationButtonPressed extends RegistrationEvent {

  final RegUser regUser;

  RegistrationButtonPressed({@required this.regUser});
   
  @override
  Stream<RegistrationState> applyAsync(
      {RegistrationState currentState, RegistrationBloc bloc}) async* {
    try {
      yield RegistrationProgress();
     final isCreated = await bloc.userRepository.createMember(user: regUser);

     if (isCreated) {
       
        yield RegistrationSuccessState('Registration Successful');
        await Future.delayed(Duration(milliseconds: 1200 ));
       bloc.authenticationBloc.add(AuthenticationStarted());
       
        yield RegistrationInitial();



     

       
     } else {
       yield ErrorRegistrationState('Unable to Register');
     }
      
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadRegistrationEvent', error: _, stackTrace: stackTrace);
      yield ErrorRegistrationState( _?.toString());
    }
}
}
