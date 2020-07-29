import 'package:flutter/material.dart';
import 'package:lassafeverdiagnosticsystem/animations/FadeAnimation.dart';

import 'package:lassafeverdiagnosticsystem/bloc/get_user_detail_bloc.dart';
import 'package:lassafeverdiagnosticsystem/models/register_model.dart';
import 'package:lassafeverdiagnosticsystem/widgets/build_error.dart';
import 'package:lassafeverdiagnosticsystem/widgets/build_loading.dart';

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
                              return BuildLoadingWidget();
                            }
                          },
                        );
                      }
          
            Widget _builddashHeading(RegUser data) {

              RegUser user = data;


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
                                      text: ' BAMI \n',
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: 'We are glad to see you again \n ${user.firstname} ',
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
                  )
                 
                ],
              );
                
            }
}