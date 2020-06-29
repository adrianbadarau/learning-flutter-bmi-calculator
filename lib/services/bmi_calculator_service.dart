import 'dart:math';

import 'package:bmi_calculator/config/enums.dart';

class BmiCalculatorService {
  final int height;
  final int weight;
  final int age;
  final Sex sex;

  double _bmi = 0;

  BmiCalculatorService({this.height, this.weight, this.age, this.sex});

  String calculateBMI() {
    _bmi = (weight / pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi == 0) calculateBMI();
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more!';
    } else if (_bmi > 18.5) {
      return 'You have a normal body wight. Good job';
    } else {
      return 'You have a lower than normal body weight. Try to eat more';
    }
  }
}
