import 'package:flutter/material.dart';
import 'package:lassafeverdiagnosticsystem/screens/diagnosis_screen.dart';

Step stepWidget({String title, Function onChanged, QuestionAnswer groupValue, bool isStepComplete}) {
  bool isStepComplete;
  return Step(
    
    title: Text(title,
    style: TextStyle(
      fontSize: 18,
      color: Colors.white),),
  
    content: Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              title: const Text('Yes',
              style: TextStyle(color: Colors.white),),
              leading: Radio(
                  value: QuestionAnswer.Yes,
                  groupValue: groupValue,
                  onChanged: onChanged),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text('No',
              style: TextStyle(color: Colors.white),),
              leading: Radio( 
                            
                  value: QuestionAnswer.No,
                  groupValue: groupValue,
                  onChanged: onChanged),
            ),
          ),
        ],
      ),
    ),
  );
}


//  [
//                       stepWidget(
//                           title: "Do u feel weak?",
                          
//                           groupValue: _ans1,
//                           onChanged: (QuestionAnswer value) {
                            
//                             setState(() {
//                               _ans1 = value;
//                               if(_ans1 == QuestionAnswer.Yes){

//                               diagnose.isWeak = true;

//                             }else
//                             diagnose.isWeak = false;
//                             });
//                           }),

//                            stepWidget(
//                           title: "Do you have Headache?",
                        
//                           groupValue: _ans2,
//                           onChanged: (QuestionAnswer value) {
//                             setState(() {
//                             _ans2 = value;
//                               if(_ans2 == QuestionAnswer.Yes){

//                               diagnose.haveHeadache = true;

//                             }else
//                             diagnose.haveHeadache = false;
//                             });
//                           }),

//                            stepWidget(
//                           title: "Do you have SoreThroat?",
//                           isStepComplete: false,
//                           groupValue: _ans3,
//                           onChanged: (QuestionAnswer value) {
//                             setState(() {
//                             _ans3 = value;
//                               if(_ans3 == QuestionAnswer.Yes){

//                               diagnose.haveSoreThroat = true;

//                             }else
//                             diagnose.haveSoreThroat = false;
//                             });
//                           }),

//                            stepWidget(
//                           title: "Are you coughing?",
                          
//                           groupValue: _ans4,
//                           onChanged: (QuestionAnswer value) {
//                             setState(() {
//                                _ans4 = value;
//                               if(_ans4 == QuestionAnswer.Yes){

//                               diagnose.isCoughing = true;

//                             }else
//                             diagnose.isCoughing = false;
//                             });
                              
                            
//                           }),

//                            stepWidget(
//                           title: "Are you Vommiting?",
                        
//                           groupValue: _ans5,
//                           onChanged: (QuestionAnswer value) {
//                             setState(() {
//                             _ans5 = value;
//                               if(_ans5 == QuestionAnswer.Yes){

//                               diagnose.isVomitting = true;

//                             }else
//                             diagnose.isVomitting = false;
//                             });
//                           }),

//                            stepWidget(
//                           title: "Do you have Diarrheoa?",
                        
//                           groupValue: _ans6,
//                           onChanged: (QuestionAnswer value) {
//                             setState(() {
//                             _ans6 = value;
//                               if(_ans6 == QuestionAnswer.Yes){

//                               diagnose.isVomitting = true;

//                             }else
//                             diagnose.isVomitting = false;
//                             });
//                           }),
//                     ],
