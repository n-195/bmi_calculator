import 'dart:math';

class BMICalculatorBrain {
  late final int height;
  late final int weight;
  late double _bmi;

  BMICalculatorBrain({required this.height, required this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 35) {
      return 'Obese';
    } else if (_bmi > 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Healthy';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 35) {
      return 'You are highly vulnerable to diseases. Improve your eating habits and try to exercise more.';
    } else if (_bmi > 25) {
      return 'You have higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Keep up the good work and try not to slack off!';
    } else {
      return 'You have lower than normal body weight. Try eating a bit more.';
    }
  }
}
