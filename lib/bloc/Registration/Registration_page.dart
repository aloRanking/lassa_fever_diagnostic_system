import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Authentication/Authentication_bloc.dart';

import 'package:lassafeverdiagnosticsystem/bloc/Registration/index.dart';
import 'package:lassafeverdiagnosticsystem/repository/user_repository.dart';
import 'package:lassafeverdiagnosticsystem/screens/register_screen.dart';

class RegistrationPage extends StatefulWidget {
  static const String routeName = '/registration';

  final UserRepository userRepository;
  const RegistrationPage({
    Key key,
    this.userRepository,
  }) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body:SafeArea(
              child: BlocProvider(
          create: (context){
            return RegistrationBloc(
              userRepository: widget.userRepository, 
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context));
          },
          child: RegisterPage(),

    ),
    
    
    
    ),

    
    
    
    );
  }
}
