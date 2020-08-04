import 'dart:async';
import 'dart:developer' as developer;

import 'package:lassafeverdiagnosticsystem/models/survey_model.dart';
import 'package:meta/meta.dart';

import 'package:lassafeverdiagnosticsystem/bloc/Survey/index.dart';
import 'package:lassafeverdiagnosticsystem/models/register_model.dart';

@immutable
abstract class SurveyEvent {
  Stream<SurveyState> applyAsync(
      {SurveyState currentState, SurveyBloc bloc});
}

class UnSurveyEvent extends SurveyEvent {
  @override
  Stream<SurveyState> applyAsync({SurveyState currentState, SurveyBloc bloc}) async* {
    yield UnSurveyState();
  }
}

class LoadSurveyEvent extends SurveyEvent {
   
  @override
  Stream<SurveyState> applyAsync(
      {SurveyState currentState, SurveyBloc bloc}) async* {
    try {
      yield UnSurveyState();
      await Future.delayed(Duration(seconds: 1));
      yield SuccessSurveyState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadSurveyEvent', error: _, stackTrace: stackTrace);
      yield ErrorSurveyState( _?.toString());
    }
  }
}

class SubmitButtonPressed extends SurveyEvent {

  final Survey userSurvey;

  SubmitButtonPressed({
    this.userSurvey,
  });
   
  @override
  Stream<SurveyState> applyAsync(
      {SurveyState currentState, SurveyBloc bloc}) async* {
    try {
      yield SurveySubmissionInProgress();
      var postedSurvey = await bloc.userRepository.postSurvey(survey: userSurvey);
     
     if(postedSurvey != null){
        yield SuccessSurveyState(postedSurvey);
        yield UnSurveyState();

     }else{
       yield ErrorSurveyState('Unable to submit');
     }

      //await Future.delayed(Duration(seconds: 1));
     
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadSurveyEvent', error: _, stackTrace: stackTrace);
      yield ErrorSurveyState( _?.toString());
    }
  }
}


