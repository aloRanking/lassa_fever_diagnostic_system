import 'package:flutter/material.dart';
import 'package:lassafeverdiagnosticsystem/animations/SlideAnimation.dart';
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
      body: Stack(
        children: <Widget>[
          Container(),
          SingleChildScrollView(
                      child: Column(
              children: <Widget>[
                SlideAnimation(delay: 1,
                                  child: PreventionCard( 
                    titleText: 'Personal Hygine',
                    subText: 'Wash Hands with soap under running water',
                    imageLink: 'images/washing-hands.png',),
                ),
                  SlideAnimation(delay: 1.2,
                                      child: PreventionCard( 
                    titleText: 'Food Hygine',
                    subText: 'Cook food properly and \nkeep food from rodent',
                    imageLink: 'images/cooking-pot.png',),
                  ),

                  SlideAnimation(delay: 1.3,
                                      child: PreventionCard( 
                    titleText: 'Proper Sanitation',
                    subText: 'Keep House and Environment clean',
                    imageLink: 'images/cleaning.png'),
                  ),

                  SlideAnimation(delay: 1.4,
                                      child: PreventionCard( 
                    titleText: 'Keep Rodents Away',
                    subText: 'Block holes and \nkeep rodents away',
                    imageLink: 'images/no-rat.png'),
                  ),
              ],
            ),
          )
        ],
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
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: <Widget>[

          Container(),

           Container(
          height: 120,
          width: screenWidth*0.65,
          decoration: BoxDecoration(
            color: Colors.lightBlue[600],
            borderRadius: BorderRadius.all(Radius.circular(15)), 

            boxShadow: [/* BoxShadow(
              offset: Offset(-5.0, -5.0),
              blurRadius: 15,
              spreadRadius: 1,


              color: Colors.white70
            ),
 */
            BoxShadow(
              //offset: Offset(5.0, 5.0),
              blurRadius: 15,
              spreadRadius: 5,


              color: Color(0xFF3b6391)
            ),
            
            ]         
          ),
          child: Center(
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

         Align(
           alignment: Alignment.centerRight,
           
           
                    child: Image.asset(imageLink,
                    height: screenHeight*0.16,
               ),
         )
     



        ],
              
              ),
    );
  }
}
