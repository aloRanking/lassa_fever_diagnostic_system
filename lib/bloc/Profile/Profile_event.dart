import 'dart:async';
import 'dart:developer' as developer;

import 'package:meta/meta.dart';

import 'package:lassafeverdiagnosticsystem/bloc/Profile/index.dart';
import 'package:lassafeverdiagnosticsystem/models/register_model.dart';

@immutable
abstract class ProfileEvent {
  Stream<ProfileState> applyAsync(
      {ProfileState currentState, ProfileBloc bloc});
}

class UnProfileEvent extends ProfileEvent {
  @override
  Stream<ProfileState> applyAsync({ProfileState currentState, ProfileBloc bloc}) async* {
    yield UnProfileState();
  }
}

class LoadProfileEvent extends ProfileEvent {
   
  @override
  Stream<ProfileState> applyAsync(
      {ProfileState currentState, ProfileBloc bloc}) async* {
    try {
      yield UnProfileState();
      await Future.delayed(Duration(seconds: 1));
      yield UpdateSuccessfulState('Hello world');
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadProfileEvent', error: _, stackTrace: stackTrace);
      yield ErrorProfileState( _?.toString());
    }
  }

  

}

class UpdateButtonPressed extends ProfileEvent {

final RegUser user;
  UpdateButtonPressed({
    this.user,
  });


  @override
  Stream<ProfileState> applyAsync(
      {ProfileState currentState, ProfileBloc bloc}) async* {
    try {
      yield UpdateInProgressState();
      int userId = user.getUser_id;

      bool isUpdated = await bloc.userRepository.updateMember(regUser: user, id: userId);
      if (isUpdated) {
         yield UpdateSuccessfulState('Record Updated');
         await Future.delayed(Duration(seconds: 1));
         yield UpdateIntialState();



        
      } else {
         yield ErrorProfileState( 'Unable to update');

      }
            
           
          } catch (_, stackTrace) {
            developer.log('$_', name: 'LoadProfileEvent', error: _, stackTrace: stackTrace);
           
          }
        }
      }
     
     
