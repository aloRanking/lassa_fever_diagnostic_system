import 'dart:async';
import 'dart:developer' as developer;


import 'package:meta/meta.dart';

import 'index.dart';

@immutable
abstract class AuthenticationEvent {
  Stream<AuthenticationState> applyAsync(
      {AuthenticationState currentState, AuthenticationBloc bloc});
}

class UnAuthenticationEvent extends AuthenticationEvent {
  @override
  Stream<AuthenticationState> applyAsync({AuthenticationState currentState, AuthenticationBloc bloc}) async* {
    yield AuthenticationInitial();
  }
}

class LoadAuthenticationEvent extends AuthenticationEvent {
   
  @override
  Stream<AuthenticationState> applyAsync(
      {AuthenticationState currentState, AuthenticationBloc bloc}) async* {
    try {
      yield AuthenticationInitial();
      await Future.delayed(Duration(seconds: 1));
     yield RegistrationPageState();
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadAuthenticationEvent', error: _, stackTrace: stackTrace);
      yield ErrorAuthenticationState( _?.toString());
    }
  }
}

class AuthenticationStarted extends AuthenticationEvent {

//final UserRepository userRepository = UserRepository();
 

  @override
  Stream<AuthenticationState> applyAsync({AuthenticationState currentState, AuthenticationBloc bloc}) async*{
    
     final String hasToken = await bloc.userRepository.hasToken();

    if (hasToken != null) {
      yield AuthenticationSuccess(token: hasToken);
    } else {
      yield ErrorAuthenticationState('Authentication Failed');
    }
  }
    
  }


class AuthenticationLoggedIn extends AuthenticationEvent {
  final String token;
  //final UserRepository userRepository = UserRepository();

   AuthenticationLoggedIn({@required this.token });

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'AuthenticationLoggedIn { token: $token }';

  @override
  Stream<AuthenticationState> applyAsync(
    {AuthenticationState currentState, AuthenticationBloc bloc}) async*{
    
 try {
      yield AuthenticationInProgress();
      if (token == null) {
        yield ErrorAuthenticationState("Login Failed");
        
      } else {
        await bloc.userRepository.persistToken(token);
    yield AuthenticationSuccess(token: token);

      }
    
      
    } catch (_, stackTrace) {
      developer.log('$_', name: 'AuthenticationLoggedIn', error: _, stackTrace: stackTrace);
      yield ErrorAuthenticationState( _?.toString());
    }
  }

  }


class AuthenticationLoggedOut extends AuthenticationEvent {
  @override
  Stream<AuthenticationState> applyAsync(
    {AuthenticationState currentState, AuthenticationBloc bloc}) async*{

      try {
       yield AuthenticationInProgress();
    await bloc.userRepository.deleteToken();
    yield ErrorAuthenticationState("LOgged OUT");
      
    } catch (_, stackTrace) {
      developer.log('$_', name: 'AuthenticationLoggedOut', error: _, stackTrace: stackTrace);
      yield ErrorAuthenticationState( _?.toString());
    }
  }
   
  }

  class LoadRegistrationEvent extends AuthenticationEvent {
   
  @override
  Stream<AuthenticationState> applyAsync(
      {AuthenticationState currentState, AuthenticationBloc bloc}) async* {
    try {
      //await Future.delayed(Duration(seconds: 1));
     yield RegistrationPageState();
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadAuthenticationEvent', error: _, stackTrace: stackTrace);
      yield ErrorAuthenticationState( _?.toString());
    }
  }
}

class ProfileScreenEvent extends AuthenticationEvent {
   
  @override
  Stream<AuthenticationState> applyAsync(
      {AuthenticationState currentState, AuthenticationBloc bloc}) async* {
    try {
      //await Future.delayed(Duration(seconds: 1));
     yield ProfilePageState();
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadAuthenticationEvent', error: _, stackTrace: stackTrace);
      yield ErrorAuthenticationState( _?.toString());
    }
  }
}

  



