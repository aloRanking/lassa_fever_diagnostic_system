import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lassafeverdiagnosticsystem/models/user_model.dart';
import 'package:lassafeverdiagnosticsystem/utils/constants.dart';
import 'package:lassafeverdiagnosticsystem/widgets/customized_form.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  List<String> _gender = ['Male', 'Female']; // Option 2
  String _selectedGender; // Option 2

  User loginUser = User();
  final _formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
   // var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF0E3360),
      
      
      body: SafeArea(
              child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(8.0),
                width: screenWidth,
                child: Column(
                  children: <Widget>[
                    Text('Lassa Fever Detection System',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      CustomizedFormField(
                        screenWidth: screenWidth,
                        shudTextCenter: true,
                        hintText: "Full Name",
                        shudObscure: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
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
                        saved: (String val) =>
                            setState(() => loginUser.email = val),
                      ),
                      CustomizedFormField(
                        screenWidth: screenWidth,
                        shudTextCenter: true,
                        hintText: "Phonenumber",
                        shudObscure: false,
                        keyBoardType: TextInputType.phone,
                      
                        
                         validator: (value) {
                        if (!phoneRegex.hasMatch(value)) {
                          return 'Please enter valid phone number';
                        }
                        return null;
                      },
                        
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      
                      Container(
                        height: 50,
                        width: screenWidth * 0.90,
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
                                  });
                                }),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomizedFormField(
                        screenWidth: screenWidth,
                        shudTextCenter: true,
                        hintText: "Password",
                        shudObscure: true,
                        keyBoardType: TextInputType.visiblePassword,
                        validator: (value){
                           if (value.isEmpty) {
                            return 'Please input your password';
                          } if(value.toString().length<4){
                            return 'Password is too short';
                          } 
                          return null;
                        
                        },
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
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
              ),
              SizedBox(
                height: 10,
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
                child: Text(' Login',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ),
      ),
    );
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
