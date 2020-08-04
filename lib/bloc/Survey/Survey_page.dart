import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Authentication/Authentication_bloc.dart';

import 'package:lassafeverdiagnosticsystem/bloc/Survey/index.dart';
import 'package:lassafeverdiagnosticsystem/models/register_model.dart';
import 'package:lassafeverdiagnosticsystem/repository/user_repository.dart';
import 'package:lassafeverdiagnosticsystem/screens/survey_screen.dart';

class SurveyPage extends StatefulWidget {
  static const String routeName = '/survey';

  final UserRepository userRepository;
  final RegUser user;
  const SurveyPage({
    Key key,
    this.userRepository,
    this.user,
  }) : super(key: key);
  

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
      body: BlocProvider(
        create: (context){
        return SurveyBloc(
          userRepository: widget.userRepository,        

        );
      },
      
      child: SurveyScreen(user: widget.user),
      )
    );
  }
}
