import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/const_color.dart';
import 'package:bmi_calculator/calculate_fun.dart';

import 'resualt_screen.dart';

const bottonContainerheight = 80.0;

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedgender;
  int height = 175;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    child: Reuseable_Card(
                      colour: selectedgender == Gender.male
                          ? kActivecolorcard
                          : kInactivecardcolor,
                      bourder: Border.all(
                          color: selectedgender == Gender.male
                              ? kActivemalebordercolor
                              : kInactivebordercolor,
                          width: 4.0),
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                        colouur: selectedgender == Gender.male
                            ? kActivemaleiconcolor
                            : kInactiveiconecolor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedgender = Gender.female;
                    });
                  },
                  child: Reuseable_Card(
                    colour: selectedgender == Gender.female
                        ? kActivecolorcard
                        : kInactivecardcolor,
                    bourder: Border.all(
                        color: selectedgender == Gender.female
                            ? kActivefemalebordercolor
                            : kInactivebordercolor,
                        width: 4.0),
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                      colouur: selectedgender == Gender.female
                          ? kActivefemaleiconcolor
                          : kInactiveiconecolor,
                    ),
                  ),
                ))
              ],
            )),
            Expanded(
              child: Reuseable_Card(
                colour: kActivecolorcard,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kLabelTextStylenumber,
                        ),
                        Text(
                          ' cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Color(0x29F9AA33),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 110.0,
                        max: 240.0,
                        activeColor: Color(0xFFF9AA33),
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Reuseable_Card(
                    colour: kActivecolorcard,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: kLabelTextStylenumber,
                            ),
                            Text(
                              'kg',
                              style: TextStyle(
                                  fontSize: 12.0, color: Color(0xFF8D8E98)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Reuseable_Card(
                    colour: kActivecolorcard,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              age.toString(),
                              style: kLabelTextStylenumber,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus ,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
            GestureDetector(
              onTap: (){
                CalculatorFun calc = CalculatorFun(height: height , weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Resault(
                        BMIResult:calc.CaculateBMI() ,
                        ResultText:calc.getResult() ,
                        Interpretation:calc.getInterpretation() ,
                      );
                    },
                  ),
                );
              },
              child: Container(
                child: Center(
                    child: Text('Calculate your BMI',
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
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  @override
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon , color: Color(0xFFF9AA33),),
      elevation: 3.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4E4F5E),
      onPressed: onPressed,
    );
  }
}
