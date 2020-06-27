import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomizedFormField extends StatelessWidget {
  final double screenWidth;
  final String hintText;
  final bool shudObscure;
  final Function validator;
  final Function saved;
  final TextInputType keyBoardType;
  final List<TextInputFormatter> inputFormatters;
  final bool shudTextCenter;
  final int maxLines;
  final Icon icon;
  CustomizedFormField(
      {this.screenWidth,
      this.hintText,
      this.shudObscure,
      this.validator,
      this.saved,
      this.keyBoardType,
      this.inputFormatters,
      this.shudTextCenter,
      this.maxLines, 
      this.icon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        style: TextStyle(color: Colors.white,
        fontSize: 18),
        textAlign: shudTextCenter? TextAlign.center : TextAlign.start,
        obscureText: shudObscure,
        maxLines: maxLines ?? 1,
        keyboardType: keyBoardType,
        inputFormatters: inputFormatters,



        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
          prefixIcon: icon,
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
          errorBorder:OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(
              color: Colors.redAccent,
              width: 3.0,
            ), 
        ),
        ),
        validator: validator,
        onSaved: saved,
      ),
    );
  }
}
