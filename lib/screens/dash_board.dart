import 'package:flutter/material.dart';
import 'package:lassafeverdiagnosticsystem/screens/diagnosis_screen.dart';
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
                      CircleAvatar(
                        //backgroundColor: Colors.white10,
                        radius: 30,
                        backgroundImage: AssetImage('images/alobam.jpg'),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text('Lassa Fever \nDiagnosis System',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      )),
                ),
                SizedBox(height: 15),
                Container(
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
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> DiagnoseScreen()));
                            },
                          ),
                        ),
                        Expanded(
                          child: DashBoardCard(
                            dashText: 'Prevention',
                            color: Color(0xFFdd7118),
                            icon: Icons.mode_comment,
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
                          ),
                        ),
                        Expanded(
                          child: DashBoardCard(
                            dashText: 'Settings',
                            color: Color(0xFFe222e2),
                            icon: Icons.settings,
                          ),
                        )
                      ],
                    ),
                  ],
                )),
                SizedBox(height: 30),
                Container(
                  height: screenHeight * 0.32,
                  width: screeWidth - 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: kSymptomsColor,
                  ),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                          bottom: 8.0,
                          left: 16.0,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'Symptoms about \nLassa Fever',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                            Container(
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
                            )
                          ],
                        ),
                      )
                    ],
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
