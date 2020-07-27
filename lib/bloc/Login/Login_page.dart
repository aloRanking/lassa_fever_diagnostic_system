import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Authentication/index.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Login/index.dart';
import 'package:lassafeverdiagnosticsystem/repository/user_repository.dart';
import 'package:lassafeverdiagnosticsystem/screens/login_screen.dart';


class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
        create: (context){
          return LoginBloc(
            userRepository: widget.userRepository, 
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context));
        },
        
        child: LoginForm(),
        )
    );
  }
}
