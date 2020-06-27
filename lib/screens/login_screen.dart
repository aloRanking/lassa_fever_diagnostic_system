import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:lassafeverdiagnosticsystem/animations/FadeAnimation.dart';

import 'package:lassafeverdiagnosticsystem/models/user_model.dart';

import 'package:lassafeverdiagnosticsystem/screens/dash_board.dart';
import 'package:lassafeverdiagnosticsystem/screens/register_screen.dart';
import 'package:lassafeverdiagnosticsystem/utils/constants.dart';
import 'package:lassafeverdiagnosticsystem/widgets/customized_form.dart';

class LoginPage extends StatefulWidget {
  //  final AuthenticationService authenticationService;

  //  LoginPage({Key key, @required this.authenticationService})
  //     : assert(authenticationService != null),
  //       super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  User loginUser = User();

  //AuthenticationService get authenticationService => widget.authenticationService;

  @override
  void initState() {
    // TODO: implement initState
    //  _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    // _loginBloc = LoginBloc(_authenticationBloc, authenticationService
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0E3360),
      body: SafeArea(
        child: SingleChildScrollView(
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  // final LoginBloc loginBloc;
  // final AuthenticationBloc authenticationBloc;

  // LoginForm({
  //   Key key,
  //   @required this.loginBloc,
  //   @required this.authenticationBloc,
  // }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  //LoginBloc get loginBloc => widget.loginBloc;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight,
      child: Stack(
        children: <Widget>[
          _backgroundCover(context),
          Positioned(
            top: screenHeight * 0.28,
            left: 15,
            right: 15,
            child: Container(
              margin: EdgeInsets.only(top: 20.0),
              height: screenHeight * 0.62,
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
                          1,
                          Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 40),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                          1.2,
                          Text(
                            "Lassa Fever Diagnostic System",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      _textFormFieldContainer(context, _formKey),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Container _textFormFieldContainer(BuildContext context, var _formKey) {
  var screenWidth = MediaQuery.of(context).size.width;
  //var screenHeight = MediaQuery.of(context).size.height;
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: <Widget>[
          Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  CustomizedFormField(
                    screenWidth: screenWidth,
                    shudTextCenter: false,
                    hintText: "Enter your Email",
                    shudObscure: false,
                    icon: Icon(Icons.mail, color: Colors.white),
                    keyBoardType: TextInputType.emailAddress,

                    validator: (value) {
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid Email';
                      }
                      return null;
                    },
                    // saved: (String val) => setState(() =>  widget.loginUser.email= val),
                  ),
                  CustomizedFormField(
                    screenWidth: screenWidth,
                    shudTextCenter: false,
                    hintText: "Enter your Password",
                    icon: Icon(Icons.security, color: Colors.white),
                    shudObscure: true,
                    keyBoardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },

                    //saved: (String val) => setState(() =>  widget.loginUser.password= val),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FadeAnimation(
                          1.5,
                          Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.grey),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("login Button Clicked");

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DashBoard()));

                      // if (_formKey.currentState.validate()) {
                      //    _formKey.currentState.save();

                      //   //  Navigator.push(context,
                      //   //  MaterialPageRoute(builder: (context)=>DashBoard()));

                      //   // If the form is valid, display a snackbar. In the real world,
                      //   // you'd often call a server or save the information in a database.

                      //   Scaffold.of(context).showSnackBar(
                      //       SnackBar(
                      //           content:
                      //               Text('Processing Data')));
                      // }
                    },
                    child: Container(
                      height: 50,
                      width: screenWidth,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, _createRoute(RegisterPage()));
              print('Sign up clicked');
            },
            child: FadeAnimation(
                1.5,
                Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
          ),
        ],
      ),
    ),
  );
}

Align _backgroundCover(BuildContext context) {
  var screenWidth = MediaQuery.of(context).size.width;
  var screenHeight = MediaQuery.of(context).size.height;
  return Align(
    alignment: Alignment.topCenter,
    child: Container(
      height: screenHeight * 0.55,
      width: screenWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            image: AssetImage('images/persondoctor.jpg'),
            fit: BoxFit.cover,
          )),
    ),
  );
}

Route _createFadeRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => RegisterPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      /*var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      //var tween = Tween(begin: begin, end: end);

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);*/

      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = 0.0;
      var end = 1.0;
      var curve = Curves.bounceIn;
      //var tween = Tween(begin: begin, end: end);
      //var offsetAnimation = animation.drive(tween);

      // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      var scaleTween = Tween<double>(begin: begin, end: end)
          .animate(CurvedAnimation(parent: animation, curve: curve));
      return ScaleTransition(
        scale: scaleTween,
        child: child,
      );
    },
  );
}
