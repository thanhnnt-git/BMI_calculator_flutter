import 'dart:math';

class CalculatorBrain {
  final int _weight;
  final int _height;
  double _bmi;

  // String category;
  CalculatorBrain(this._weight, this._height);

  String calculateBMI() {
    _bmi = _weight / _height / _height * 10000;
    return _bmi.toStringAsFixed(1);
  }

  String getBMIRange() {
    if (_bmi >= 18.5 && _bmi <= 25) {
      return '18.5 - 25 kg/m2';
    } else if (_bmi > 25 && _bmi <= 30) {
      return '25 - 30 kg/m2';
    } else if (_bmi > 30) {
      return '>30 kg/m2';
    } else {
      return '<18.5 kg/m2';
    }
  }

  String getInterpretation() {
    if (_bmi >= 18.5 && _bmi <= 25) {
      return 'You have normal body weight. Good job!';
    } else if (_bmi > 25 && _bmi <= 30) {
      return 'You are overweight. Try to avoid gaining additional weight';
    } else if (_bmi > 30) {
      return 'You have a obese body. Eat healthy foods more.';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  String getStatus() {
    if (_bmi >= 18.5 && _bmi <= 25) {
      return 'Normal';
    } else if (_bmi > 25 && _bmi <= 30) {
      return 'Overweight';
    } else if (_bmi > 30) {
      return 'Obese';
    } else {
      return 'Thinness';
    }
  }
}
