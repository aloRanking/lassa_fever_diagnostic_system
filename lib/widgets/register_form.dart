import 'package:flutter/material.dart';

class CustomizedFormField extends StatelessWidget {

  final double screenWidth;
  final String hintText;
  final bool shudObscure;
  final Function validator;
  CustomizedFormField ({this.screenWidth, this.hintText, this.shudObscure, this.validator });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: screenWidth * 0.90 -20 ,
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          obscureText: shudObscure,

          decoration: InputDecoration(
              hintText:hintText,
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,


          ),
        ),
      ),
    );
  }


}
