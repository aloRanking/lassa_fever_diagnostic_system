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
  CustomizedFormField(
      {this.screenWidth,
      this.hintText,
      this.shudObscure,
      this.validator,
      this.saved,
      this.keyBoardType,
      this.inputFormatters});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
        obscureText: shudObscure,
        keyboardType: keyBoardType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white),
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
        validator: validator,
        onSaved: saved,
      ),
    );
  }
}
