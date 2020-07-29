import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lassafeverdiagnosticsystem/bloc/Authentication/Authentication_bloc.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Authentication/Authentication_event.dart';
import 'package:lassafeverdiagnosticsystem/models/register_model.dart';
import 'package:lassafeverdiagnosticsystem/models/user_model.dart';
import 'package:lassafeverdiagnosticsystem/utils/constants.dart';
import 'package:lassafeverdiagnosticsystem/widgets/customized_form.dart';

class Profilescreen extends StatefulWidget {
  final RegUser regUser;
  const Profilescreen({
    Key key,
    this.regUser,
  }) : super(key: key);
  
  @override
  _ProfilescreenState createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  final _formKey = GlobalKey<FormState>();
  User loginUser = User();

  initialValue(val) {
  return TextEditingController(text: val);
}

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    List<String> _gender = ['Male', 'Female']; // Option 2
    String _selectedGender = widget.regUser.getGender;// O

    return Scaffold(
      backgroundColor: kBackgroundColor,
      extendBodyBehindAppBar: true,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: 1,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('images/person-default.png'),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: 22,
                  left: 30,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios, color: Colors.white))),
                       Positioned(
                  top: 22,
                  right: 30,
                  child: InkWell(
                      onTap: () {
                       BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationLoggedOut());
                     /*   if (state ) {
                         
                       } */
                      },
                      child: Text('LogOut',
                      style:TextStyle(color:Colors.white),),
                      ),),
            ],
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SizedBox(height: 20),
                Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        CustomizedFormField(
                          screenWidth: screenWidth,
                          shudTextCenter: false,
                          hintText: "Full NAme",
                          icon: Icon(Icons.person, color: Colors.white),
                          shudObscure: false,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },

                          controller: initialValue(widget.regUser.firstname ),
                        ),
                        CustomizedFormField(
                          screenWidth: screenWidth,
                          shudTextCenter: false,
                          hintText: "Email",
                          icon: Icon(Icons.mail, color: Colors.white),
                          shudObscure: false,
                          validator: (value) {
                            if (!emailRegex.hasMatch(value)) {
                              return 'Please enter a valid Email';
                            }
                            return null;
                          },
                          controller: initialValue(widget.regUser.email ),
                          saved: (String val) =>
                              setState(() => loginUser.email = val),
                        ),
                        CustomizedFormField(
                          screenWidth: screenWidth,
                          shudTextCenter: false,
                          hintText: "Phonenumber",
                          icon: Icon(Icons.phone, color: Colors.white),
                          shudObscure: false,
                          keyBoardType: TextInputType.phone,
                          validator: (value) {
                            if (!phoneRegex.hasMatch(value)) {
                              return 'Please enter valid phone number';
                            }
                            return null;
                          },
                          controller: initialValue(widget.regUser.phonenumber )
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
                          shudTextCenter: false,
                          hintText: "Residential State",
                          icon: Icon(Icons.location_on, color: Colors.white),
                          shudObscure: false,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: initialValue(widget.regUser.resstate )
                        ),
                        CustomizedFormField(
                          screenWidth: screenWidth,
                          shudTextCenter: false,
                          hintText: "Residential LG",
                          icon: Icon(Icons.location_on, color: Colors.white),
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
                          shudTextCenter: false,
                          hintText: "Residential Home Address",
                          icon: Icon(Icons.location_on, color: Colors.white),
                          maxLines: 2,
                          shudObscure: false,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: initialValue(widget.regUser.reshome_address )
                        ),
                        CustomizedFormField(
                          screenWidth: screenWidth,
                          shudTextCenter: false,
                          hintText: "Password",
                          shudObscure: true,
                          keyBoardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please input your password';
                            }
                            if (value.toString().length < 4) {
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
                          'Update',
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
              ],
            ),
          ),
        ],
      )),
    );
  }
}
