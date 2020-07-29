import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Registration/index.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({
    Key key,
    @required RegistrationBloc registrationBloc,
  })  : _registrationBloc = registrationBloc,
        super(key: key);

  final RegistrationBloc _registrationBloc;

  @override
  RegistrationScreenState createState() {
    return RegistrationScreenState();
  }
}

class RegistrationScreenState extends State<RegistrationScreen> {
  RegistrationScreenState();

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
    return BlocBuilder<RegistrationBloc, RegistrationState>(
        bloc: widget._registrationBloc,
        builder: (
          BuildContext context,
          RegistrationState currentState,
        ) {
          if (currentState is UnRegistrationState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorRegistrationState) {
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
           if (currentState is InRegistrationState) {
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
    widget._registrationBloc.add(RegistrationInEvent());
  }
}
