import 'package:flutter/material.dart';
import 'package:lassafeverdiagnosticsystem/models/diagnose_model.dart';
import 'package:lassafeverdiagnosticsystem/models/diagnose_model2.dart';
import 'package:lassafeverdiagnosticsystem/screens/result_screen.dart';
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
  QuestionAnswer _ans7;
  QuestionAnswer _ans8;
  QuestionAnswer _ans9;
  QuestionAnswer _ans10;
  QuestionAnswer _ans11;
  QuestionAnswer _ans12;

  Diagnose2 diagnose = Diagnose2();
  int currentStep;

  List<StepState> _listState;

  List<Step> _createSteps(BuildContext context) {
    List<Step> _steps = <Step>[
      Step(
        state: currentStep == 0
            ? _listState[1]
            : currentStep > 0 ? _listState[2] : _listState[0],
        title: Text('Do you Headache?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
        content: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.Yes,
                    groupValue: _ans1,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans1 = value;
                        if (_ans1 == QuestionAnswer.Yes) {
                          diagnose.isHeadache = true;
                        }
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    'No',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.No,
                    groupValue: _ans1,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans1 = value;
                        if (_ans1 == QuestionAnswer.No) {
                          diagnose.isHeadache = false;
                        }
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
        title: Text('Are you Feeling Dizzy?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
        content: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.Yes,
                    groupValue: _ans2,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans2 = value;
                        if (_ans2 == QuestionAnswer.Yes)
                          diagnose.isDizzy = true;

                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    'No',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.No,
                    groupValue: _ans2,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans2 = value;
                        if (_ans2 == QuestionAnswer.No)

                          diagnose.isDizzy = false;
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
        title: Text('Do you have ChestPain?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
        content: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.Yes,
                    groupValue: _ans3,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans3 = value;
                        if (_ans3 == QuestionAnswer.Yes)
                          diagnose.isChestPain = true;

                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    'No',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.No,
                    groupValue: _ans3,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans3 = value;
                        if (_ans3 == QuestionAnswer.No)
                          diagnose.isChestPain = false;
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
        title: Text('Are you Vomiting?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
        content: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.Yes,
                    groupValue: _ans4,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans4 = value;
                        if (_ans4 == QuestionAnswer.Yes)
                          diagnose.isVomiting = true;

                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    'No',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.No,
                    groupValue: _ans4,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans4 = value;
                        if (_ans4 == QuestionAnswer.No)
                          diagnose.isVomiting = false;
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
        state: currentStep == 4
            ? _listState[1]
            : currentStep > 4 ? _listState[2] : _listState[0],
        title: Text('Any Form of Paralysis?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
        content: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.Yes,
                    groupValue: _ans5,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans5 = value;
                        if (_ans5 == QuestionAnswer.Yes)
                          diagnose.isParalysis = true;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    'No',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.No,
                    groupValue: _ans5,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans5 = value;
                        if (_ans5 == QuestionAnswer.No)
                          diagnose.isParalysis = false;
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
        state: currentStep == 5
            ? _listState[1]
            : currentStep > 5 ? _listState[2] : _listState[0],
        title: Text('Slurring Speech?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
        content: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.Yes,
                    groupValue: _ans6,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans6 = value;
                        if (_ans6 == QuestionAnswer.Yes)
                          diagnose.isSlurSpeech = true;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    'No',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.No,
                    groupValue: _ans6,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans6 = value;
                        if (_ans6 == QuestionAnswer.No)
                          diagnose.isSlurSpeech = false;
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
        state: currentStep == 6
            ? _listState[1]
            : currentStep > 6 ? _listState[2] : _listState[0],
        title: Text('Is your breath short?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
        content: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.Yes,
                    groupValue: _ans7,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans7 = value;
                        if (_ans7 == QuestionAnswer.Yes)
                          diagnose.isShortBreath = true;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    'No',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.No,
                    groupValue: _ans7,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans7 = value;
                        if (_ans7 == QuestionAnswer.No)
                          diagnose.isShortBreath = false;
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
        state: currentStep == 7
            ? _listState[1]
            : currentStep > 7 ? _listState[2] : _listState[0],
        title: Text('Are you feeling Nauseated?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
        content: Container(
          child: Row(
            children: <Widget>[
              Flexible(
                child: ListTile(
                  title: const Text(
                    'Yes',
                    style: TextStyle(

                        color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.Yes,
                    groupValue: _ans8,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans8 = value;
                        if (_ans8 == QuestionAnswer.Yes)
                          diagnose.isChestPain = true;

                      });
                    },
                  ),
                ),
              ),
              Flexible(
                child: ListTile(
                  title: Text(
                    'No',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.No,
                    groupValue: _ans8,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans8 = value;
                        if (_ans8 == QuestionAnswer.No)
                          diagnose.isChestPain = false;
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
        state: currentStep == 8
            ? _listState[1]
            : currentStep > 8 ? _listState[2] : _listState[0],
        title: Text('Are you feeling tired?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
        content: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.Yes,
                    groupValue: _ans9,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans9 = value;
                        if (_ans9 == QuestionAnswer.Yes)
                          diagnose.isTiredness = true;

                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    'No',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.No,
                    groupValue: _ans9,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans9 = value;
                        if (_ans9 == QuestionAnswer.No)
                          diagnose.isTiredness = false;
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
        state: currentStep == 9
            ? _listState[1]
            : currentStep > 9 ? _listState[2] : _listState[0],
        title: Text('Do you have stomach pain?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
        content: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.Yes,
                    groupValue: _ans10,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans10 = value;
                        if (_ans10 == QuestionAnswer.Yes)
                          diagnose.isStomachPain = true;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    'No',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.No,
                    groupValue: _ans10,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans10 = value;
                        if (_ans10 == QuestionAnswer.No)
                          diagnose.isStomachPain = false;
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
        state: currentStep == 10
            ? _listState[1]
            : currentStep > 10 ? _listState[2] : _listState[0],
        title: Text('Do you experience blurry vision?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
        content: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.Yes,
                    groupValue: _ans11,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans11 = value;
                        if (_ans11 == QuestionAnswer.Yes)
                          diagnose.isBlurVision = true;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    'No',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.No,
                    groupValue: _ans11,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans11 = value;
                        if (_ans11 == QuestionAnswer.No)
                          diagnose.isBlurVision = false;
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
        state: currentStep == 11
            ? _listState[1]
            : currentStep > 11 ? _listState[2] : _listState[0],
        title: Text('Do you have excess body fat?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
        content: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.Yes,
                    groupValue: _ans12,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans12 = value;
                        if (_ans12 == QuestionAnswer.Yes)
                          diagnose.isBodyFat = true;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListTile(
                  title: Text(
                    'No',
                    style: TextStyle(color: Colors.white),
                  ),
                  leading: Radio(
                    value: QuestionAnswer.No,
                    groupValue: _ans12,
                    onChanged: (QuestionAnswer value) {
                      setState(() {
                        _ans12 = value;
                        if (_ans12 == QuestionAnswer.No)
                          diagnose.isBodyFat = false;
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
                        "Done",
                      ),
                      actions: <Widget>[
                        new TextButton(
                          child: new Text("View Result"),
                          onPressed: () {
                            print('is headach  is ${diagnose.isHeadache}');
                            print('is dizzy is ${diagnose.isDizzy}');
                           // print('is vomitting is ${diagnose.isVomitting}');
                            setState(() {
                              complete = false;
                              currentStep = 0;

                            });
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ResultScreen(diagnose: diagnose)));
                          },
                        ),
                      ],
                    ),
                  ),
                )
              : Expanded(
                  child: Stepper(
                    steps: _createSteps(context),
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
