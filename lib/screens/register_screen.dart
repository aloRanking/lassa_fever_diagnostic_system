import 'package:flutter/material.dart';
import 'package:lassafeverdiagnosticsystem/widgets/form_field.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  List<String> _gender = ['Male', 'Female']; // Option 2
  String _selectedGender; // Option 2

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF0E3360),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: screenWidth,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    Text('Register',
                        style: TextStyle(
                          fontSize: 25,
                        )),
                    SizedBox(height: 10),
                    Text('Lassa Fever Detection System',
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Form(
                  child: Column(
                children: <Widget>[
                  FormFieldBox(
                    screenWidth: screenWidth,
                    hintText: "Full Name",
                    shudObscure: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FormFieldBox(
                    screenWidth: screenWidth,
                    hintText: "Email",
                    shudObscure: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FormFieldBox(
                    screenWidth: screenWidth,
                    hintText: "Phonenumber",
                    shudObscure: false,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    width: screenWidth * 0.90 - 20,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
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
                  SizedBox(
                    height: 15,
                  ),
                  FormFieldBox(
                    screenWidth: screenWidth,
                    hintText: "Password",
                    shudObscure: true,
                  ),
                ],
              )),
              SizedBox(
                height: 15,
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
                  )),
              SizedBox(
                height: 10,
              ),
              Text(' Login',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
