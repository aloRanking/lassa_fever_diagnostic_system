import 'package:flutter/material.dart';

class BuildLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Center(
       child: Container(
         child: SizedBox(
           height: 25.0,
           width: 25.0,
           child: CircularProgressIndicator(
             valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
             strokeWidth: 4.0,
           ),
         ),
       ),
     );
  }
}