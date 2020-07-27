import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {

  final List propss;
  AuthenticationState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class AuthenticationInitial extends AuthenticationState {

  AuthenticationInitial();

  @override
  String toString() => 'AuthenticationInitial';
}

/// Initialized
class AuthenticationSuccess extends AuthenticationState {
  final String hello;

  AuthenticationSuccess(this.hello) : super([hello]);

  @override
  String toString() => 'AuthenticationSuccess $hello';

}

class ErrorAuthenticationState extends AuthenticationState {
  final String errorMessage;

  ErrorAuthenticationState(this.errorMessage): super([errorMessage]);
  
  @override
  String toString() => 'ErrorAuthenticationState';
}

class AuthenticationInProgress extends AuthenticationState {}
