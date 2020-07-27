import 'dart:async';
import 'dart:developer' as developer;


import 'package:lassafeverdiagnosticsystem/bloc/Authentication/index.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Login/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent {
  Stream<LoginState> applyAsync(
      {LoginState currentState, LoginBloc bloc});
}

class UnLoginEvent extends LoginEvent {
  @override
  Stream<LoginState> applyAsync({LoginState currentState, LoginBloc bloc}) async* {
    yield UnLoginState();
  }
}

class LoadLoginEvent extends LoginEvent {
   
  @override
  Stream<LoginState> applyAsync(
      {LoginState currentState, LoginBloc bloc}) async* {
    try {
      yield UnLoginState();
      await Future.delayed(Duration(seconds: 1));
      yield InLoginState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadLoginEvent', error: _, stackTrace: stackTrace);
      yield ErrorLoginState( _?.toString());
    }
  }
}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

   LoginButtonPressed({
    @required this.username,
    @required this.password,
  });

  @override
  List<Object> get props => [username, password];

  @override
  String toString() =>
      'LoginButtonPressed { username: $username, password: $password }';

  @override
  Stream<LoginState> applyAsync({LoginState currentState, LoginBloc bloc}) async*{

     try {
        yield LoginInProgress();
      final token = await bloc.userRepository.authenticate(
          user: username,
          pass: password,
        );

        bloc.authenticationBloc.add(AuthenticationLoggedIn(token: token));
        yield LoginInitial();
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoginButtonPressed', error: _, stackTrace: stackTrace);
      yield ErrorLoginState( _?.toString());
    }
  }
    
  }

