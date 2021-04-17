import 'dart:math';

class Calculator {
  Calculator({this.weight, this.height});
  final int height;
  final int weight;
  double _bmi = 20.0;
  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi > 25 || _bmi == 25) {
      return 'Overweight';
    } else if (_bmi > 18.5 && _bmi < 25) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You are overweight. Fatty! you gotta exercise to loose weight';
    } else if (_bmi > 18.5) {
      return 'You have a normal weight';
    } else {
      return 'These are rooky numbers. Gotta pump these up. Eat more!';
    }
  }
}
