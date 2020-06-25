import 'package:flutter/material.dart';
import 'package:lassafeverdiagnosticsystem/models/diagnose_model.dart';
import 'package:lassafeverdiagnosticsystem/utils/constants.dart';
import 'package:lassafeverdiagnosticsystem/widgets/step.dart';

enum QuestionAnswer { Yes, No }

class DiagnoseScreen extends StatefulWidget {
  @override
  _DiagnoseScreenState createState() => _DiagnoseScreenState();
}

class _DiagnoseScreenState extends State<DiagnoseScreen> {
  QuestionAnswer _ans1;
  QuestionAnswer _ans2;
  QuestionAnswer _ans3;
  QuestionAnswer _ans4;
  QuestionAnswer _ans5;
  QuestionAnswer _ans6;

  Diagnose diagnose = Diagnose();
 int currentStep;

  List<StepState> _listState;



 List<Step> _createSteps(BuildContext context) {

    List<Step> _steps = <Step>[
       Step(
        state: currentStep == 0
            ? _listState[1]
            : currentStep > 0 ? _listState[2] : _listState[0],
        title: Text('Do you feel weak?',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        )
        ),
        content: Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              title: const Text('Yes',
              style: TextStyle(color: Colors.white),),
              leading: Radio(
                  value: QuestionAnswer.Yes,
                  groupValue: _ans1,
                  onChanged: (QuestionAnswer value) {                            
                            setState(() {
                              _ans1 = value;
                              if(_ans1 == QuestionAnswer.Yes){

                              diagnose.isWeak = true;

                            }else
                            diagnose.isWeak = false;
                            });
                          },
            ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text('No',
              style: TextStyle(color: Colors.white),),
              leading: Radio( 
                            
                  value: QuestionAnswer.No,
                  groupValue: _ans1,
                  onChanged: (QuestionAnswer value) {                            
                            setState(() {
                              _ans1 = value;
                              if(_ans1 == QuestionAnswer.Yes){

                              diagnose.isWeak = true;

                            }else
                            diagnose.isWeak = false;
                            });
                          },
            ),
          ),
          )
        ],
      ),
    ),
        isActive: true,
      ),

          Step(
        state: currentStep == 1
            ? _listState[1]
            : currentStep > 1 ? _listState[2] : _listState[0],
        title: Text('Are you Coughing',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        )
        ),
        content: Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              title: const Text('Yes',
              style: TextStyle(color: Colors.white),),
              leading: Radio(
                  value: QuestionAnswer.Yes,
                  groupValue: _ans1,
                  onChanged: (QuestionAnswer value) {                            
                            setState(() {
                              _ans1 = value;
                              if(_ans1 == QuestionAnswer.Yes){

                              diagnose.isWeak = true;

                            }else
                            diagnose.isWeak = false;
                            });
                          },
            ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text('No',
              style: TextStyle(color: Colors.white),),
              leading: Radio( 
                            
                  value: QuestionAnswer.No,
                  groupValue: _ans1,
                  onChanged: (QuestionAnswer value) {                            
                            setState(() {
                              _ans1 = value;
                              if(_ans1 == QuestionAnswer.Yes){

                              diagnose.isWeak = true;

                            }else
                            diagnose.isWeak = false;
                            });
                          },
            ),
          ),
          )
        ],
      ),
    ),
        isActive: true,
      ),

          Step(
        state: currentStep == 2
            ? _listState[1]
            : currentStep > 2 ? _listState[2] : _listState[0],
        title: Text('Do you have Headache?',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        )
        ),
        content: Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              title: const Text('Yes',
              style: TextStyle(color: Colors.white),),
              leading: Radio(
                  value: QuestionAnswer.Yes,
                  groupValue: _ans1,
                  onChanged: (QuestionAnswer value) {                            
                            setState(() {
                              _ans1 = value;
                              if(_ans1 == QuestionAnswer.Yes){

                              diagnose.isWeak = true;

                            }else
                            diagnose.isWeak = false;
                            });
                          },
            ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text('No',
              style: TextStyle(color: Colors.white),),
              leading: Radio( 
                            
                  value: QuestionAnswer.No,
                  groupValue: _ans1,
                  onChanged: (QuestionAnswer value) {                            
                            setState(() {
                              _ans1 = value;
                              if(_ans1 == QuestionAnswer.Yes){

                              diagnose.isWeak = true;

                            }else
                            diagnose.isWeak = false;
                            });
                          },
            ),
          ),
          )
        ],
      ),
    ),
        isActive: true,
      ),

          Step(
        state: currentStep == 3
            ? _listState[1]
            : currentStep > 3 ? _listState[2] : _listState[0],
        title: Text('Do you have Sore Throat?',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        )
        ),
        content: Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              title: const Text('Yes',
              style: TextStyle(color: Colors.white),),
              leading: Radio(
                  value: QuestionAnswer.Yes,
                  groupValue: _ans1,
                  onChanged: (QuestionAnswer value) {                            
                            setState(() {
                              _ans1 = value;
                              if(_ans1 == QuestionAnswer.Yes){

                              diagnose.isWeak = true;

                            }else
                            diagnose.isWeak = false;
                            });
                          },
            ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text('No',
              style: TextStyle(color: Colors.white),),
              leading: Radio( 
                            
                  value: QuestionAnswer.No,
                  groupValue: _ans1,
                  onChanged: (QuestionAnswer value) {                            
                            setState(() {
                              _ans1 = value;
                              if(_ans1 == QuestionAnswer.Yes){

                              diagnose.isWeak = true;

                            }else
                            diagnose.isWeak = false;
                            });
                          },
            ),
          ),
          )
        ],
      ),
    ),
        isActive: true,
      ),

      Step(
        state: currentStep == 3
            ? _listState[1]
            : currentStep > 3 ? _listState[2] : _listState[0],
        title: Text('Do you have dry Cough?',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        )
        ),
        content: Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              title: const Text('Yes',
              style: TextStyle(color: Colors.white),),
              leading: Radio(
                  value: QuestionAnswer.Yes,
                  groupValue: _ans1,
                  onChanged: (QuestionAnswer value) {                            
                            setState(() {
                              _ans1 = value;
                              if(_ans1 == QuestionAnswer.Yes){

                              diagnose.isWeak = true;

                            }else
                            diagnose.isWeak = false;
                            });
                          },
            ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text('No',
              style: TextStyle(color: Colors.white),),
              leading: Radio( 
                            
                  value: QuestionAnswer.No,
                  groupValue: _ans1,
                  onChanged: (QuestionAnswer value) {                            
                            setState(() {
                              _ans1 = value;
                              if(_ans1 == QuestionAnswer.Yes){

                              diagnose.isWeak = true;

                            }else
                            diagnose.isWeak = false;
                            });
                          },
            ),
          ),
          )
        ],
      ),
    ),
        isActive: true,
      ),

      Step(
        state: currentStep == 3
            ? _listState[1]
            : currentStep > 3 ? _listState[2] : _listState[0],
        title: Text('Are you vomitting?',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        )
        ),
        content: Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              title: const Text('Yes',
              style: TextStyle(color: Colors.white),),
              leading: Radio(
                  value: QuestionAnswer.Yes,
                  groupValue: _ans1,
                  onChanged: (QuestionAnswer value) {                            
                            setState(() {
                              _ans1 = value;
                              if(_ans1 == QuestionAnswer.Yes){

                              diagnose.isWeak = true;

                            }else
                            diagnose.isWeak = false;
                            });
                          },
            ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text('No',
              style: TextStyle(color: Colors.white),),
              leading: Radio( 
                            
                  value: QuestionAnswer.No,
                  groupValue: _ans1,
                  onChanged: (QuestionAnswer value) {                            
                            setState(() {
                              _ans1 = value;
                              if(_ans1 == QuestionAnswer.Yes){

                              diagnose.isWeak = true;

                            }else
                            diagnose.isWeak = false;
                            });
                          },
            ),
          ),
          )
        ],
      ),
    ),
        isActive: true,
      ),
      Step(
        state: currentStep == 3
            ? _listState[1]
            : currentStep > 3 ? _listState[2] : _listState[0],
        title: Text('Do you have Diarrheoa?',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        )
        ),
        content: Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: ListTile(
              title: const Text('Yes',
              style: TextStyle(color: Colors.white),),
              leading: Radio(
                  value: QuestionAnswer.Yes,
                  groupValue: _ans1,
                  onChanged: (QuestionAnswer value) {                            
                            setState(() {
                              _ans1 = value;
                              if(_ans1 == QuestionAnswer.Yes){

                              diagnose.isWeak = true;

                            }else
                            diagnose.isWeak = false;
                            });
                          },
            ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text('No',
              style: TextStyle(color: Colors.white),),
              leading: Radio( 
                            
                  value: QuestionAnswer.No,
                  groupValue: _ans1,
                  onChanged: (QuestionAnswer value) {                            
                            setState(() {
                              _ans1 = value;
                              if(_ans1 == QuestionAnswer.Yes){

                              diagnose.isWeak = true;

                            }else
                            diagnose.isWeak = false;
                            });
                          },
            ),
          ),
          )
        ],
      ),
    ),
        isActive: true,
      ),
       
      
    ];
    return _steps;
  }

  //int currentStep = 0;
  bool complete = false;
  bool isStepDone = false;

  next() {
    currentStep + 1 != _createSteps(context).length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() { 
      currentStep = step;
      isStepDone = true;
      });
  }


  @override
  void initState() {
    // TODO: implement initState
    currentStep = 0;
    _listState = [
      StepState.indexed,
      StepState.editing,
      StepState.complete,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text('Diagnose'),
      ),
      body: Column(
        children: <Widget>[
          complete
              ? Expanded(
                  child: Center(
                    child: AlertDialog(
                      title: new Text("Diagnose Complete"),
                      content: new Text(
                        "Tada!",
                      ),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text("Close"),
                          onPressed: () {
                            print('is weak is ${diagnose.isWeak}');
                            print('is coughin is ${diagnose.isCoughing}');
                            print('is vomitting is ${diagnose.isVomitting}');
                            setState(() => complete = false);
                          },
                        ),
                      ],
                    ),
                  ),
                )
              : Expanded(
                  child: Stepper(
                    
                    
                    steps:_createSteps(context),
                    currentStep: currentStep,
                    onStepContinue: next,
                    onStepTapped: (step) => goTo(step),
                    onStepCancel: cancel,
                  ),
                ),
        ],
      ),
    );
  }
}
