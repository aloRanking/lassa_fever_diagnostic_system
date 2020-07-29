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

  _launchURL() async {
    const url = 'tel:0800 970000 10';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DashBoardHeading(email: payload['sub']),
                  SizedBox(height: 10),
                  SlideAnimation(
                    delay: 1.5,
                    child: Container(
                        child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: DashBoardCard(
                                dashText: 'Diagnose',
                                color: Color(0xFF4723bc),
                                icon: Icons.local_hospital,
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(SizeRoute(page: DiagnoseScreen()));
                                },
                              ),
                            ),
                            Expanded(
                              child: DashBoardCard(
                                dashText: 'Prevention',
                                color: Color(0xFFdd7118),
                                icon: Icons.mode_comment,
                                onPressed: () {
                                  Navigator.of(context).push(
                                      SizeRoute(page: PreventionScreen()));
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: DashBoardCard(
                                dashText: 'Survey',
                                color: Color(0xFFcfea20),
                                icon: Icons.folder_open,
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(_createRoute(SurveyScreen()));
                                },
                              ),
                            ),
                            Expanded(
                              child: DashBoardCard(
                                  dashText: 'Profile',
                                  color: Color(0xFFe222e2),
                                  icon: Icons.person,
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(_createRoute(Profilescreen()));
                                  }),
                            )
                          ],
                        ),
                      SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: DashBoardCard(
                                dashText: 'Help-Line',
                                color: Color(0xFFBEA7E5),
                                icon: Icons.call,
                                onPressed: () {
                                   _launchURL();
                                },
                              ),
                            ),
                            Expanded(
                              child: DashBoardCard(
                                  dashText: 'Hospital',
                                  color: Color(0xFFA64E90),
                                  icon: Icons.settings,
                                  onPressed: () {
                                    /* Navigator.of(context)
                                        .push(_createRoute(Profilescreen())); */
                                  }),
                            )
                          ],
                        ),
                     
                      ],
                    )),
                  ),
                  SizedBox(height: 20),
                  SlideAnimation(
                    delay: 2,
                    child: Container(
                      height: screenHeight * 0.32,
                      width: screeWidth - 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: kSymptomsColor,
                      ),
                      child: Stack(
                        children: <Widget>[
                          Container(),
                          Image.asset(
                            'images/fever.png',
                            height: screenHeight*0.4,
                            width: screeWidth*0.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                'Symptoms about \nLassa Fever',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                margin: EdgeInsets.only(bottom:20),
                                height: screenHeight * 0.1,
                                width: screeWidth*0.40 ,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: kDashBColor,
                                ),
                                child: Center(
                                  child: Text(
                                    'Learn More',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DashBoardCard extends StatelessWidget {
  final String dashText;
  final IconData icon;
  final Color color;
  final Function onPressed;

  DashBoardCard({this.dashText, this.icon, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    var screeWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: screenHeight * 0.1,
         // width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: kDashBColor,
          ),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Container(
                height: 45,
                width: screeWidth*0.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: color,
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                dashText,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: Duration(milliseconds: 600),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
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

class SizeRoute extends PageRouteBuilder {
  final Widget page;
  SizeRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Align(
            child: SizeTransition(
              sizeFactor: animation,
              child: child,
            ),
          ),
        );
}
