import 'package:flutter/material.dart';
import 'package:lassafeverdiagnosticsystem/utils/constants.dart';

class SurveyScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
     var screeWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text('Survey'),
        backgroundColor: kBackgroundColor,
      ),
      body: Stack(
        children: <Widget>[
          Container(),

          Image.asset('images/survey-form.png'),


          Positioned(
            top:200,
                      child: Container(
                        width: screeWidth,
              height: screenHeight*0.55,

              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(20),
                  topRight:Radius.circular(20)
                  )
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 15,),
                  headerText(),
                  _surveyForm(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding headerText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'We will be glad if you could help us fill this survey form',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
      ),
    );
  }

  _surveyForm(BuildContext context) {
     var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                   hintStyle: TextStyle(color: Colors.white),
                  hintText:
                      'Give us feedback about the app and what would you like us to add',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    ),
                  ),
                   enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(
                color: Color(0xFFFFCA60),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(
                color: Color(0xFFFFCA60),
                width: 2.0,
              ),
            ),
                ),
              ),

              SizedBox(height: 10,),

               Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    // Validate returns true if the form is valid, otherwise false.
                    if (_formKey.currentState.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));
                    }
                  },
                  child: Container(
                    width: screenWidth * 0.90 ,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),


            ],
          )),
    );
  }
}
