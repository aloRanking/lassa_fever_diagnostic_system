import 'package:flutter/material.dart';
import 'package:lassafeverdiagnosticsystem/animations/FadeAnimation.dart';
import 'package:lassafeverdiagnosticsystem/animations/SlideAnimation.dart';
import 'package:lassafeverdiagnosticsystem/screens/diagnosis_screen.dart';
import 'package:lassafeverdiagnosticsystem/screens/prevention_screen.dart';
import 'package:lassafeverdiagnosticsystem/screens/settings.dart';
import 'package:lassafeverdiagnosticsystem/screens/survey_screen.dart';
import 'package:lassafeverdiagnosticsystem/utils/constants.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screeWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF0E3360),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FadeAnimation(
                        1,
                        RichText(
                          text: TextSpan(
                            text: 'Hello,',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' BAMI \n',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: 'We are glad to see you again',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Hero(
                        tag: 1,
                        child: CircleAvatar(
                          //backgroundColor: Colors.white10,
                          radius: 30,
                          backgroundImage: AssetImage('images/person-default.png'),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text('Lassa Fever \nDiagnosis System',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      )),
                ),
                SizedBox(height: 15),
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
                              onPressed: (){
                                Navigator.of(context)
                                    .push(SizeRoute(page: PreventionScreen()));
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: DashBoardCard(
                              dashText: 'Help Line',
                              color: Color(0xFFcfea20),
                              icon: Icons.call,
                              onPressed: (){

                                 Navigator.of(context)
                                      .push(_createRoute(SurveyScreen()));

                              },
                            ),
                          ),
                          Expanded(
                            child: DashBoardCard(
                                dashText: 'Settings',
                                color: Color(0xFFe222e2),
                                icon: Icons.settings,
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(_createRoute(SettingScreen()));
                                }),
                          )
                        ],
                      ),
                    ],
                  )),
                ),
                SizedBox(height: 30),
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
                          height: 230,
                          width: 200,
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
                              height: screenHeight * 0.1,
                              width: 180,
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
                )
              ],
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
          width: 180,
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
                width: 45,
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
