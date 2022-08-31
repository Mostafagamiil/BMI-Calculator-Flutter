import 'package:flutter/material.dart';


class Reuseable_Card extends StatelessWidget {
  Reuseable_Card({this.colour, this.cardChild, this.bourder});
  final Color colour;
  final Widget cardChild;
  final Border bourder;

  @override
  Widget build(BuildContext context) {
    return Container(

      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        border: bourder,
        color: colour,
        borderRadius: BorderRadius.circular(10.0),

      ),
    );
  }
}