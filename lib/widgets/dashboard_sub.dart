import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lassafeverdiagnosticsystem/animations/FadeAnimation.dart';
import 'package:lassafeverdiagnosticsystem/animations/SlideAnimation.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Authentication/Authentication_bloc.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Authentication/Authentication_event.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Survey/Survey_page.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Survey/index.dart';

import 'package:lassafeverdiagnosticsystem/bloc/get_user_detail_bloc.dart';
import 'package:lassafeverdiagnosticsystem/models/register_model.dart';
import 'package:lassafeverdiagnosticsystem/repository/user_repository.dart';
import 'package:lassafeverdiagnosticsystem/screens/diagnosis_screen.dart';
import 'package:lassafeverdiagnosticsystem/screens/prevention_screen.dart';
import 'package:lassafeverdiagnosticsystem/screens/profile_screen.dart';
import 'package:lassafeverdiagnosticsystem/screens/survey_screen.dart';
import 'package:lassafeverdiagnosticsystem/utils/constants.dart';
import 'package:lassafeverdiagnosticsystem/widgets/build_error.dart';
import 'package:lassafeverdiagnosticsystem/widgets/build_loading.dart';
import 'package:lassafeverdiagnosticsystem/widgets/dashboard_card.dart';
import 'package:lassafeverdiagnosticsystem/widgets/size_route.dart';
import 'package:url_launcher/url_launcher.dart';

class DashBoardHeading extends StatefulWidget {
  final String email;
  const DashBoardHeading({
    Key key,
    this.email,
  }) : super(key: key);
  @override
  _DashBoardHeadingState createState() => _DashBoardHeadingState();
}

class _DashBoardHeadingState extends State<DashBoardHeading> {
  @override
  void initState() {
    getUserDetailBloc..getMenuList(widget.email);
    super.initState();
  }

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
     
    return StreamBuilder<RegUser>(
      stream: getUserDetailBloc.subject.stream,
      builder: (context, AsyncSnapshot<RegUser> snapshot) {
        if (snapshot.hasData) {
         /*  if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return BuildErrorWidget(error:snapshot.data.error);
          } */
          return _builddashHeading(snapshot.data);

                            } else if (snapshot.hasError) {
                              return BuildErrorWidget(error:snapshot.error);
                            } else {
                              return Center(child: BuildLoadingWidget());
                            }
                          },
                        );
                      }
          
            Widget _builddashHeading(RegUser data) {
              var screeWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

              RegUser user = data;

              UserRepository userRepository = UserRepository();


              return  Column(
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
                                      text: ' ${user.firstname} \n'.toUpperCase(),
                                      
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: 'Welcome Back  ',
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
                                backgroundImage:
                                    AssetImage('images/person-default.png'),
                              ),
                            )
                          ],
                        ),
                      ),
                        Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        child: Text('Lassa Fever \nDiagnosis System',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            )),
                      ),
                      Spacer(),
                    ],
                  ),
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
                                      .push(_createRoute(page:SurveyPage(user: user, userRepository: userRepository,)));
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
                                        .push(_createRoute(page:Profilescreen(regUser:user)));
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
                                 // BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationLoggedOut());
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
              );
                
            }

            Route _createRoute({Widget page, UserRepository userRepository}) {
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

}