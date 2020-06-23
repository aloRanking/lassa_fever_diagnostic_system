import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lassafeverdiagnosticsystem/animations/FadeAnimation.dart';
import 'package:lassafeverdiagnosticsystem/widgets/form_field.dart';

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
                                    FormFieldBox(screenWidth: screenWidth, hintText:"Enter your Email" , shudObscure: false,),
                                    SizedBox(height: 15,),
                                    FormFieldBox(screenWidth: screenWidth,hintText: "Password", shudObscure: true,),
                                    SizedBox(height: 15,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        FadeAnimation(1.5, Text("Forgot Password?", style: TextStyle(color: Colors.grey),)),
                                      ],
                                    ),
                                    SizedBox(height: 15,),
                                    InkWell(
                                      child: Container(
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
                                    ),
                                    SizedBox(height: 30,),

                                    SizedBox(width: 10,),
                                    GestureDetector(
                                      onTap: (){
                                        print('Sign up clicked');
                                      },
                                      child: FadeAnimation(1.5, Text("Sign Up",
                                        style: TextStyle(
                                            color: Colors.grey,
                                        fontSize: 20),)),
                                    ),







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

