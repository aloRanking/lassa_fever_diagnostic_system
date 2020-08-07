import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Profile/index.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key key,
    @required ProfileBloc profileBloc,
  })  : _profileBloc = profileBloc,
        super(key: key);

  final ProfileBloc _profileBloc;

  @override
  ProfileScreenState createState() {
    return ProfileScreenState();
  }
}

class ProfileScreenState extends State<ProfileScreen> {
  ProfileScreenState();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
        bloc: widget._profileBloc,
        builder: (
          BuildContext context,
          ProfileState currentState,
        ) {
          if (currentState is UnProfileState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorProfileState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage ?? 'Error'),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('reload'),
                    onPressed: _load,
                  ),
                ),
              ],
            ));
          }
           if (currentState is UpdateSuccessfulState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(currentState.hello),
                ],
              ),
            );
          }
          return Center(
              child: CircularProgressIndicator(),
          );
          
        });
  }

  void _load() {
    widget._profileBloc.add(LoadProfileEvent());
  }
}
