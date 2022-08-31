import 'package:bmi_calculator/const_color.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/input.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xFF1A1D1F),
            ),
        scaffoldBackgroundColor: Color(0xFF1A1D1F),
      ),
      home: newSplashScreen(),
    );
  }
}

class newSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          const Text(
            'BMI App',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF9AA33),
            ),
          ),
          spinkit,
        ],
      ),
      backgroundColor: Color(0xFF1A1D1F),
      nextScreen: InputPage(),
    );
  }
}
