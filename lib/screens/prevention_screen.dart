import 'package:flutter/material.dart';
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
                PreventionCard( 
                  titleText: 'Personal Hygine',
                  subText: 'Wash Hands with soap under running water',
                  imageLink: 'images/washing-hands.png',),
                  PreventionCard( 
                  titleText: 'Food Hygine',
                  subText: 'Cook food properly and \nkeep food from rodent',
                  imageLink: 'images/cooking-pot.png',),

                  PreventionCard( 
                  titleText: 'Proper Sanitation',
                  subText: 'Keep House and Environment clean',
                  imageLink: 'images/cleaning.png'),

                  PreventionCard( 
                  titleText: 'Keep Rodents Away',
                  subText: 'Block holes and \nkeep rodents away',
                  imageLink: 'images/no-rat.png'),
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
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: <Widget>[

          Container(),

           Container(
          height: 120,
          width: 300,
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
                      fontSize: 24,
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
                      fontSize: 18,
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
                    height: 150,
               ),
         )
     



        ],
              
              ),
    );
  }
}
