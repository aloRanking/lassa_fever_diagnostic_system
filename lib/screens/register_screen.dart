import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Authentication/Authentication_bloc.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Authentication/Authentication_event.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Login/index.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Registration/Registration_bloc.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Registration/index.dart';
import 'package:lassafeverdiagnosticsystem/models/register_model.dart';
import 'package:lassafeverdiagnosticsystem/models/user_model.dart';
import 'package:lassafeverdiagnosticsystem/repository/user_repository.dart';
import 'package:lassafeverdiagnosticsystem/utils/constants.dart';
import 'package:lassafeverdiagnosticsystem/widgets/customized_form.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  List<String> _gender = ['Male', 'Female']; // Option 2
  String _selectedGender; // Option 2

  RegUser regUser = RegUser();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _textController = new TextEditingController();

@override
  void dispose() {
    
    super.dispose();
    _textController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

     _onRegisterButtonPressed() {
      BlocProvider.of<RegistrationBloc>(context).add(RegistrationButtonPressed(regUser: regUser));
    }

    return BlocListener<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (state is ErrorRegistrationState) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.errorMessage}'),
              backgroundColor: Colors.red,
            ),
          );
        }
        

                     if(state is RegistrationSuccessState){

                        Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('${state.hello}'),
                        backgroundColor: Colors.green,
                        ));
                        
                        //_textController.clear();

                     }
      },

    child:BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context,state){ 
        return Scaffold(
      backgroundColor: Color(0xFF0E3360),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[

                  InkWell(
                        onTap: () {
                           BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationStarted()
        
      );
                        },
                        child: Icon(Icons.arrow_back_ios, color: Colors.white)),

                  Text('Registration',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        )),

                  Image.asset(
                      'images/registration.png',
                      height: 100,
                      width: 100,
                    ),
                  
                ],
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      CustomizedFormField(
                        screenWidth: screenWidth,
                        shudTextCenter: true,
                        hintText: "First Name",
                        shudObscure: false,
                        //controller: _textController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        saved: (String val) =>
                            setState(() => regUser.firstname = val.trim()),
                      ),
                      CustomizedFormField(
                        screenWidth: screenWidth,
                        shudTextCenter: true,
                        hintText: "Last Name",
                        shudObscure: false,

                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        //controller: _textController,
                        saved: (String val) =>
                            setState(() => regUser.lastname = val.trim()),
                      ),
                      CustomizedFormField(
                        screenWidth: screenWidth,
                        shudTextCenter: true,
                        hintText: "Email",
                        shudObscure: false,
                        validator: (value) {
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid Email';
                          }
                          return null;
                        },
                       // controller: _textController,
                        saved: (String val) =>
                            setState(() => regUser.email = val.trim()),
                      ),
                      CustomizedFormField(
                        screenWidth: screenWidth,
                        shudTextCenter: true,
                        hintText: "Phonenumber",
                        shudObscure: false,
                        keyBoardType: TextInputType.phone,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter valid phone number';
                          }
                          return null;
                        },
                        //controller: _textController,
                        saved: (String val) =>
                            setState(() => regUser.phonenumber = val.trim()),

                      ),
                     
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 60,
                        width: screenWidth * 0.93,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color(0xFFFFCA60),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                                hint: Text(
                                    'Please choose a gender'), // Not necessary for Option 1
                                value: _selectedGender,
                                items: _gender.map((gender) {
                                  return DropdownMenuItem(
                                      child: Text(gender), value: gender);
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedGender = newValue;
                                    regUser.gender = newValue;
                                    
                                  });
                                }),
                          ),
                        ),
                      ),
                     
                      CustomizedFormField(
                        screenWidth: screenWidth,
                        shudTextCenter: true,
                        hintText: "Password",
                        shudObscure: true,
                        keyBoardType: TextInputType.visiblePassword,
                        //controller: _textController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please input your password';
                          }
                          if (value.toString().length < 4) {
                            return 'Password is too short';
                          }
                          return null;                          
                        },
                         saved: (String val) =>
                            setState(() => regUser.password = val.trim()),

                        
                        
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  // Validate returns true if the form is valid, otherwise false.
                  if (_formKey.currentState.validate()) {
                     _formKey.currentState.save();

                     _onRegisterButtonPressed();

                     

                     }

                    

                    /*  UserRepository userRepository = UserRepository();

                     userRepository.createMember(user: regUser); */
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                   /*  Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data'))); */
                  
                },
                child: Container(
                  width: screenWidth * 0.90 - 20,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                                        child: state is RegistrationProgress
                                            ? CircularProgressIndicator()
                                            : null,
                                      ),
              Text('Already have an Account ?',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                                  child: Text(' Login',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w700)),
                ),
              ),
               SizedBox(
                height: 10,
              ),
              
            ],
          ),
        ),
      ),
    );
      },
    ),);
  }
}

// Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Container(
//                         height: 50,
//                         child: FormField<String>(
//                           builder: (FormFieldState<String> state) {
//                             return InputDecorator(
//                               decoration: InputDecoration(
//                                 // labelStyle: textStyle,
//                                 errorStyle: TextStyle(
//                                     color: Colors.redAccent, fontSize: 16.0),
//                                 hintText: 'Please select a Gender',
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(25.0)),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(30.0)),
//                                   borderSide: BorderSide(
//                                     color: Color(0xFFFFCA60),
//                                     width: 1.0,
//                                   ),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(30.0)),
//                                   borderSide: BorderSide(
//                                     color: Color(0xFFFFCA60),
//                                     width: 2.0,
//                                   ),
//                                 ),
//                               ),
//                               isEmpty: _selectedGender == '',
//                               child: DropdownButtonHideUnderline(
//                                 child: DropdownButton<String>(
//                                   value: _selectedGender,
//                                   isDense: true,
//                                   onChanged: (String newValue) {
//                                     setState(() {
//                                       _selectedGender = newValue;
//                                       state.didChange(newValue);
//                                     });
//                                   },
//                                   items: _gender.map((String value) {
//                                     return DropdownMenuItem<String>(
//                                       value: value,
//                                       child: Text(value),
//                                     );
//                                   }).toList(),
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ),
