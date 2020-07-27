import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {

  final List propss;
  LoginState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnLoginState extends LoginState {

  UnLoginState();

  @override
  String toString() => 'UnLoginState';
}

class LoginInProgress extends LoginState {}

class LoginInitial extends LoginState {}

/// Initialized
class InLoginState extends LoginState {
  final String hello;

  InLoginState(this.hello) : super([hello]);

  @override
  String toString() => 'InLoginState $hello';

}

class ErrorLoginState extends LoginState {
  final String errorMessage;

  ErrorLoginState(this.errorMessage): super([errorMessage]);
  
  @override
  String toString() => 'ErrorLoginState';
}
