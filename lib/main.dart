import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lassafeverdiagnosticsystem/repository/user_repository.dart';
import 'package:lassafeverdiagnosticsystem/screens/dash_board.dart';

import 'package:lassafeverdiagnosticsystem/screens/splash_screen.dart';
import 'package:lassafeverdiagnosticsystem/widgets/loading_indicator.dart';

import 'bloc/Authentication/index.dart';
import 'bloc/Login/Login_page.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}



void main() {
   BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp( BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AuthenticationStarted());
      },
      child:MyApp(userRepository: userRepository),
    ),);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

   final UserRepository userRepository;
   /* final storage = new FlutterSecureStorage();

   Future<String> hasToken() async {
    String value = await storage.read(key: 'token');
    return value;
    
  } */

  MyApp({Key key, @required this.userRepository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
     home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          
          if (state is AuthenticationInitial) {
            
            return SplashPage();
          }
          if (state is AuthenticationSuccess) {
            
            
            
            return DashBoard(token: state.token,);
          }
          if (state is ErrorAuthenticationState) {
            return LoginPage(userRepository: userRepository);
          }
          if (state is AuthenticationInProgress) {
            return LoadingIndicator();
          }
        },
      ),
    );
    
  }
}