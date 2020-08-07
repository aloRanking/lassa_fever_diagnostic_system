import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';

import 'package:lassafeverdiagnosticsystem/bloc/Profile/index.dart';
import 'package:lassafeverdiagnosticsystem/repository/user_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  final UserRepository userRepository;
  ProfileBloc({
    this.userRepository,
  });

  @override
  ProfileState get initialState => UnProfileState();

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'ProfileBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
