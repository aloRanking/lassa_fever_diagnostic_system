import 'package:flutter/material.dart';
import 'package:lassafeverdiagnosticsystem/utils/constants.dart';

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