import 'dart:math';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi;

  CalculatorBrain({this.height, this.weight});

  String getBMI() {
    _bmi = weight / pow(height / 100, 2);

    return _bmi.toStringAsFixed(1);
  }

  Color getResultColor() {
    if (_bmi > 25)
      return kOverWeightColor;
    else if (_bmi >= 18.5)
      return kNormalColor;
    else
      return kUnderWeightColor;
  }

  String getResultText() {
    if (_bmi > 25)
      return 'OVERWEIGHT';
    else if (_bmi >= 18.5)
      return 'NORMAL';
    else
      return 'UNDERWEIGHT';
  }

  String getInterpretation() {
    if (_bmi > 25)
      return 'You have a higher than normal bodyweight. Try exercising more';
    else if (_bmi >= 18.5)
      return 'You have a normal bodyweight. Good job!';
    else
      return 'You have a lower than normal bodyweight. You can eat a little more.';
  }
}
