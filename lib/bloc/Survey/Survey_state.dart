import 'package:equatable/equatable.dart';

abstract class SurveyState extends Equatable {

  final List propss;
  SurveyState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

/// UnInitialized
class UnSurveyState extends SurveyState {

  UnSurveyState();

  @override
  String toString() => 'UnSurveyState';
}

class SurveySubmissionInProgress extends SurveyState{}

/// Initialized
class SuccessSurveyState extends SurveyState {
  final String hello;

  SuccessSurveyState(this.hello) : super([hello]);

  @override
  String toString() => 'SuccessSurveyState $hello';

}

class ErrorSurveyState extends SurveyState {
  final String errorMessage;

  ErrorSurveyState(this.errorMessage): super([errorMessage]);
  
  @override
  String toString() => 'ErrorSurveyState';
}
