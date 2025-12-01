import 'package:flutter/material.dart';

class CalculatorProvider with ChangeNotifier {
  double _result = 0;
  double get result => _result;

  void calculate(String op, double a, double b) {
    if (op == "+") _result = a + b;
    if (op == "-") _result = a - b;
    if (op == "x") _result = a * b;
    if (op == "/") _result = b == 0 ? 0 : a / b;

    notifyListeners();
  }
}
