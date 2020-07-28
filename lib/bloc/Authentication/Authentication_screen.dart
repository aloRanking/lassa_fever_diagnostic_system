import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'index.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({
    Key key,
    @required AuthenticationBloc authenticationBloc,
  })  : _authenticationBloc = authenticationBloc,
        super(key: key);

  final AuthenticationBloc _authenticationBloc;

  @override
  AuthenticationScreenState createState() {
    return AuthenticationScreenState();
  }
}

class AuthenticationScreenState extends State<AuthenticationScreen> {
  AuthenticationScreenState();

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
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        bloc: widget._authenticationBloc,
        builder: (
          BuildContext context,
          AuthenticationState currentState,
        ) {
          if (currentState is AuthenticationInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorAuthenticationState) {
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
           if (currentState is AuthenticationSuccess) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(currentState.token),
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
    widget._authenticationBloc.add(LoadAuthenticationEvent());
  }
}
