import 'package:flutter/material.dart';
import 'package:lassafeverdiagnosticsystem/screens/dash_board.dart';
import 'package:lassafeverdiagnosticsystem/screens/login.dart';
import 'package:lassafeverdiagnosticsystem/screens/register_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

