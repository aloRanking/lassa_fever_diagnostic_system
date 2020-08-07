import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lassafeverdiagnosticsystem/bloc/Profile/index.dart';
import 'package:lassafeverdiagnosticsystem/models/register_model.dart';
import 'package:lassafeverdiagnosticsystem/repository/user_repository.dart';
import 'package:lassafeverdiagnosticsystem/screens/profile_screen.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';
  final UserRepository userRepository;
  final RegUser user;
  ProfilePage({
    Key key,
    this.userRepository,
    this.user,
  }) : super(key: key);


  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: BlocProvider(
        create: (context) {
          return ProfileBloc(userRepository: widget.userRepository);

          },
      child: Profilescreen(regUser: widget.user,)),
    );
  }
}
