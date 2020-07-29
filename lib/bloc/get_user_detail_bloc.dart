import 'package:lassafeverdiagnosticsystem/models/register_model.dart';
import 'package:lassafeverdiagnosticsystem/repository/user_repository.dart';

import 'package:rxdart/subjects.dart';

class USerDetailBloc{

final UserRepository _userRepository = UserRepository();

BehaviorSubject<RegUser> _subject = BehaviorSubject<RegUser>();

getMenuList(String email) async{
RegUser response = await _userRepository.getUserByMail(email);
_subject.sink.add(response);
}

dispose() {
    _subject.close();
  }

  BehaviorSubject<RegUser> get subject => _subject;

}


final getUserDetailBloc =  USerDetailBloc();