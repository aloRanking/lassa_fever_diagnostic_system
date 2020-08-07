import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {

  final List propss;
  ProfileState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnProfileState extends ProfileState {

  UnProfileState();

  @override
  String toString() => 'UnProfileState';
}

class UpdateInProgressState extends ProfileState {}

class UpdateIntialState extends ProfileState {}



/// Initialized
class UpdateSuccessfulState extends ProfileState {
  final String hello;

  UpdateSuccessfulState(this.hello) : super([hello]);

  @override
  String toString() => 'UpdateSuccessfulState $hello';

}

class ErrorProfileState extends ProfileState {
  final String errorMessage;

  ErrorProfileState(this.errorMessage): super([errorMessage]);
  
  @override
  String toString() => 'ErrorProfileState';
}
