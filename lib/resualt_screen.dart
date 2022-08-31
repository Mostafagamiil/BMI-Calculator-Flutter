import 'package:flutter/material.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/const_color.dart';
import 'input.dart';

class Resault extends StatelessWidget {
  Resault({@required this.BMIResult , @required this.Interpretation , @required this.ResultText});
  final String BMIResult;
  final String ResultText;
  final String Interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch,

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child:
            Text(
              'Your Result',
              style: kTitleTextStyle,
            ),
          )),
          Expanded(flex: 5 ,child: Reuseable_Card(colour: kActivecolorcard,cardChild: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(ResultText.toUpperCase() , style: kResultTextStyle,),
              Text(BMIResult , style: kBMITextStyle,),
              Text(Interpretation , textAlign: TextAlign.center , style: kBodyTextStyle,)
            ],
          ),)),
          GestureDetector(
            onTap: () {

              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return InputPage();
                  },
                ),
              );
            },
            child: Container(
              child: Center(
                  child: Text('Back to Calculate',
                      style: TextStyle(
                        fontSize: 20.0,
                      ))),
              margin: EdgeInsets.all(15.0),
              width: double.infinity,
              height: kBottonContainerheight,
              decoration: BoxDecoration(
                  color: Color(0xFFF9AA33),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          )
        ],
      ),
    );

  }
}


