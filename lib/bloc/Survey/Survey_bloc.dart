import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Authentication/Authentication_bloc.dart';

import 'package:lassafeverdiagnosticsystem/bloc/Survey/index.dart';
import 'package:lassafeverdiagnosticsystem/models/register_model.dart';
import 'package:lassafeverdiagnosticsystem/repository/user_repository.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {

  
  final UserRepository userRepository;

  SurveyBloc({
    
    this.userRepository
  });
  

  @override
  SurveyState get initialState => UnSurveyState();

  @override
  Stream<SurveyState> mapEventToState(
    SurveyEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'SurveyBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
