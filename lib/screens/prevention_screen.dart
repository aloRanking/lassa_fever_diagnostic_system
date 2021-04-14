import 'package:flutter/material.dart';
import 'package:lassafeverdiagnosticsystem/animations/SlideAnimation.dart';
import 'package:lassafeverdiagnosticsystem/utils/constants.dart';
import 'package:lassafeverdiagnosticsystem/utils/constants.dart';

class PreventionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text('Prevention'),
        backgroundColor: kBackgroundColor,
      ),
      body: SingleChildScrollView(
                  child: Column(
          children: <Widget>[
            SlideAnimation(delay: 1,
                              child: PreventionCard(
                titleText: 'Exercise',
                subText: 'Exercise regularly and maintain healthy diet',
                imageLink: 'images/washing-hands.png',),
            ),
              SlideAnimation(delay: 1.2,
                                  child: PreventionCard(
                titleText: 'Stop Intoxication',
                subText: 'Stop smoking and reduce alcohol intake',
                imageLink: 'images/cooking-pot.png',),
              ),

              SlideAnimation(delay: 1.3,
                                  child: PreventionCard(
                titleText: 'Fat Diets',
                subText: 'Cut Saturated and trans fat, along with refined carbohydrates.',
                imageLink: 'images/cleaning.png'),
              ),

              SlideAnimation(delay: 1.4,
                                  child: PreventionCard(
                titleText: 'Sugar Intake',
                subText: 'Reduce sugar intake and Monitor Blood Sugar Regularly',
                imageLink: 'images/no-rat.png'),
              ),
          ],
        ),
      ),
    );
  }
}

class PreventionCard extends StatelessWidget {
 final String titleText;
 final String subText;
 final String imageLink;

 PreventionCard({this.titleText,this.subText, this.imageLink});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
            height: 120,
            width: screenWidth-50,
            decoration: BoxDecoration(
         color: Color(0xff26476f),
         borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    titleText,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    subText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
