import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lassafeverdiagnosticsystem/animations/FadeAnimation.dart';
import 'package:lassafeverdiagnosticsystem/animations/SlideAnimation.dart';
import 'package:lassafeverdiagnosticsystem/screens/diagnosis_screen.dart';
import 'package:lassafeverdiagnosticsystem/screens/prevention_screen.dart';
import 'package:lassafeverdiagnosticsystem/screens/profile_screen.dart';
import 'package:lassafeverdiagnosticsystem/screens/survey_screen.dart';
import 'package:lassafeverdiagnosticsystem/utils/JwtUtil.dart';
import 'package:lassafeverdiagnosticsystem/utils/constants.dart';
import 'package:lassafeverdiagnosticsystem/widgets/dashboard_sub.dart';
import 'package:url_launcher/url_launcher.dart';

class DashBoard extends StatelessWidget {

  final String token;

  DashBoard({Key key, this.token}) : super(key: key);

  



  @override
  Widget build(BuildContext context) {
               var screeWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
   

     var payload= parseJwt(token);


   // var payload = json.decode(utf8.decode(base64Url.decode(base64.normalize(token[1]))));
    return Scaffold(
      backgroundColor: Color(0xFF0E3360),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Container(
              height: screenHeight,
              width: screeWidth,

              
              child: DashBoardHeading(email: payload['sub']),
            ),
          ),
        ),
      ),
    );
  }
}




Route _createSlideRightRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: Duration(milliseconds: 600),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}


