import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lassafeverdiagnosticsystem/animations/FadeAnimation.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF0E3360),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight,
            child: Stack(
              children: <Widget>[

                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: screenHeight * 0.55,
                    width: screenWidth ,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          image: AssetImage('images/persondoctor.jpg'),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.30 ,
                  left: 15,
                  right: 15,

                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    height: screenHeight * 0.60,
                    width: screenWidth * 0.90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xFF264772),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 8,
                            ),
                            FadeAnimation(
                                4,
                                Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white, fontSize: 40),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            FadeAnimation(
                                5,
                                Text(
                                  "Welcome Back",
                                  style: TextStyle(color: Colors.white, fontSize: 18),
                                )),
                            SizedBox(height: 15,),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    FormField(screenWidth: screenWidth, hintText:"Enter your Email" ,),
                                    SizedBox(height: 10,),
                                    FormField(screenWidth: screenWidth,hintText: "Password",),
                                    SizedBox(height: 10,),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color: Colors.grey),)),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Container(
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),


                                    ),
                                    SizedBox(height: 30,),

                                    SizedBox(width: 10,),
                                    FadeAnimation(1.5, Text("Sign Up",
                                      style: TextStyle(
                                          color: Colors.grey,
                                      fontSize: 20),)),







                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FormField extends StatelessWidget {

  final double screenWidth;
  final String hintText;
  FormField({this.screenWidth, this.hintText});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: screenWidth * 0.90 -20 ,
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(
              hintText:hintText,
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none
          ),
        ),
      ),
    );
  }


}
