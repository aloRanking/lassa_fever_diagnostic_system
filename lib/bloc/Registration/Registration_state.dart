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

class RegistrationInitial extends RegistrationState {}

class RegistrationProgress extends RegistrationState {}

/// Initialized
class RegistrationSuccessState extends RegistrationState {
  final String hello;

  RegistrationSuccessState(this.hello) : super([hello]);

  @override
  String toString() => 'RegistrationSuccessState $hello';

  

}

class ErrorRegistrationState extends RegistrationState {
  final String errorMessage;

  ErrorRegistrationState(this.errorMessage): super([errorMessage]);
  
  @override
  String toString() => 'ErrorRegistrationState';
}
