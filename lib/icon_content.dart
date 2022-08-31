import 'package:flutter/material.dart';
import 'package:bmi_calculator/const_color.dart';


class IconContent extends StatelessWidget {
  const IconContent({this.icon , this.label, this.colouur}) ;
  final IconData icon;
  final String label;
  final Color colouur;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Icon(
          icon,
          color: colouur,
          size: 80.0,
        ),
        SizedBox(height: 17.0),
        Text(
          label,
          style: kLabelTextStyle,
        ),

      ],
    );
  }
}