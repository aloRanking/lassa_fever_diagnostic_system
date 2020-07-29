import 'package:equatable/equatable.dart';
import 'package:lassafeverdiagnosticsystem/models/register_model.dart';

abstract class RegistrationState extends Equatable {

  final List propss;
  RegistrationState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnRegistrationState extends RegistrationState {

  UnRegistrationState();

  @override
  String toString() => 'UnRegistrationState';
}

//class LoginInitial extends LoginState {}

class RegistrationProgress extends RegistrationState {}

/// Initialized
class InRegistrationState extends RegistrationState {
  final String hello;

  InRegistrationState(this.hello) : super([hello]);

  @override
  String toString() => 'InRegistrationState $hello';

  

}

class ErrorRegistrationState extends RegistrationState {
  final String errorMessage;

  ErrorRegistrationState(this.errorMessage): super([errorMessage]);
  
  @override
  String toString() => 'ErrorRegistrationState';
}
