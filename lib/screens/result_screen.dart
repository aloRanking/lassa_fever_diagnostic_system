import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lassafeverdiagnosticsystem/models/diagnose_model.dart';
import 'package:lassafeverdiagnosticsystem/models/diagnose_model2.dart';
import 'package:lassafeverdiagnosticsystem/utils/constants.dart';

class ResultScreen extends StatelessWidget {
  final Diagnose2 diagnose;

  ResultScreen({this.diagnose});


  //String result;

  String checkResult( Diagnose2 diagnose){

    if(diagnose.isHeadache == true && diagnose.isDizzy== true){

      return 'Hypertension';
    }

   else if (diagnose.isChestPain == true && diagnose.isDizzy == true || diagnose.isNausea==true) {

      return 'Heart Attack';

    }
    else if (diagnose.isParalysis == true || diagnose.isSlurSpeech == true ) {

      return 'Stroke';

    }
    else if (diagnose.isBlurVision == true && diagnose.isStomachPain == true || diagnose.isTiredness == true ) {

      return 'Diabetes';

    }
    else if(diagnose.isBodyFat = true){
      return 'Obesity';
    }

  }

  @override
  Widget build(BuildContext context) {
    String res = checkResult(diagnose);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(title: Text('Result'),),
      body: Builder(
        builder: (BuildContext context) {
          if (res == 'Hypertension') {
            return Healthissue(aliment: res,
                prv1: 'Sugar Intake Reduction',
                prv2: 'Monitor Blood Sugar Regularly');
          }else if(res == 'Diabetes' ){
            return Healthissue(aliment: res,
                prv1: 'Eating Fruits, Vegetables, and Grains.',
                prv2: 'Cut Saturated and trans fat, along with refined carbohydrates.');
          }
          else if (res == 'Heart Attack'){
            return Healthissue(aliment: res,
                prv1: 'Stop Smoking',
                prv2: 'Limit Alcohol Intake',
            prv3: 'Exercising, Maintaining Healthy Diet',
            );

          }
          else if (res == 'Stroke'){
            return Healthissue(aliment: res,
                prv1: 'Quit Smoking.',
                prv2: 'Consume alcohol in Moderation.',prv3: 'Keep weight down.',);

          }
            return Healthissue(aliment: res,
                prv1: 'Low-fat diet and Low-Card diets',
                prv2: 'Exercise and weight loss');
        }








            ),






    );
  }
}


class Healthissue extends StatelessWidget {
  final String aliment;
  final String prv1;
  final String prv2;
  final String prv3;

  Healthissue({this.aliment, this.prv1, this.prv2, this.prv3});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children:[
            SizedBox(height: 30,),
            Text('Diagnosis Result',
            style: TextStyle(
              fontSize: 18,
              color: kGreyColor,

            ),),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(12),
              child: Card(
                elevation: 8.0,
                color: Color(0xff26476f),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 15,),

                      Text(aliment.toUpperCase(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold
                        ),),
                      SizedBox(height: 15,),
                      Text('Prevention',
                      style: TextStyle(
                          fontSize: 18,
                          color: kGreyColor
                      ),),
                      SizedBox(height: 10,),
                      Container(

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('- $prv1',
                            style: TextStyle(
                                color: kGreyColor,

                            ),),
                            SizedBox(height: 10,),
                            Text('- $prv2',
                              style: TextStyle(
                                color: kGreyColor, ),
                            ),
                            SizedBox(height: 10,),
                            Text(prv3 ?? "",
                              style: TextStyle(
                                color: kGreyColor, ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),




          ]
        ),
      ),
    );
  }
}

