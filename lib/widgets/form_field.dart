import 'package:flutter/material.dart';

class FormFieldBox extends StatelessWidget {

  final double screenWidth;
  final String hintText;
  final bool shudObscure;
  FormFieldBox({this.screenWidth, this.hintText, this.shudObscure});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: screenWidth * 0.90 -20 ,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child:  Padding(
        padding: const EdgeInsets.only(top:10.0, bottom: 5, left: 15,),
        child: TextFormField(
          obscureText: shudObscure,

          decoration: InputDecoration(
            
              hintText:hintText,
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none,


          ),
           validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
        ),
      ),
    );
  }


}
