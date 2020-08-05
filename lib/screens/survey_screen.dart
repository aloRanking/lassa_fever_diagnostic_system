import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lassafeverdiagnosticsystem/bloc/Survey/index.dart';

import 'package:lassafeverdiagnosticsystem/models/register_model.dart';
import 'package:lassafeverdiagnosticsystem/models/survey_model.dart';
import 'package:lassafeverdiagnosticsystem/utils/constants.dart';

class SurveyScreen extends StatefulWidget {
  final RegUser user;

  SurveyScreen({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  Survey surveyForm = Survey();
  TextEditingController controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    surveyForm.fullname = widget.user.firstname + ' ' + widget.user.lastname;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screeWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    /*  _onSubmitButtonPressed() {
      BlocProvider.of<SurveyBloc>(context).add(
        SubmitButtonPressed(userSurvey: surveyForm),
      );
    } */

    return BlocListener<SurveyBloc, SurveyState>(listener: (context, state) {
      if (state is UnSurveyState) {
        controller.clear();

        /* Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('${state.errorMessage}'),
            backgroundColor: Colors.red,
          ),
        ); */
      }

      if (state is ErrorSurveyState) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('${state.errorMessage}'),
            backgroundColor: Colors.red,
          ),
        );
      }

      if (state is SuccessSurveyState) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('${state.hello}'),
            backgroundColor: Colors.green,
          ),
        );
      }
    }, child: BlocBuilder<SurveyBloc, SurveyState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          title: Text('Survey'),
          backgroundColor: kBackgroundColor,
        ),
        body: SingleChildScrollView(
                  child: Stack(
              children: <Widget>[
                 Container(
                   width: screeWidth,
                   height: screenHeight,
                 ),
                Image.asset('images/survey-form.png'),
                Positioned(
                  top: 200,
                  child: Container(
          width: screeWidth,
          height: screenHeight * 0.55,
          decoration: BoxDecoration(
              color: kBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20))),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              headerText(),
              _surveyForm(context, state),
            ],
          ),
                  ),
                ),
               
              ],
            ),
        ),
      );
    }));
  }

  Widget headerText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'We will be glad if you could help us fill this survey form',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
      ),
    );
  }

  _surveyForm(BuildContext context, SurveyState state) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                maxLines: 5,
                style: TextStyle(
                  color: Colors.white
                ),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText:
                      'Give us feedback about the app and what would you like us to add',
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
                controller: controller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (String val) {
                  surveyForm.setDetails = val;
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                padding: EdgeInsets.all(15),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    BlocProvider.of<SurveyBloc>(context).add(
                      SubmitButtonPressed(userSurvey: surveyForm),
                    );

                    
                  }
                },
                color: Colors.lightBlue,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 15),
                    Container(
                      child: state is SurveySubmissionInProgress
                          ? SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.white,
                              ))
                          : null,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

void _onSubmitButtonPressed() {}
