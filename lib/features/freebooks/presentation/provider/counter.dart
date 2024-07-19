import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int counter = 0;
  bool clicked = false;
  void increase() {
    if (!clicked) {
      counter++;
    }
    notifyListeners();
  }

  void toggle() {
    clicked = !clicked;
    notifyListeners();
  }

  void decrease() {
    if (!clicked) {
      counter--;
    }
    notifyListeners();
  }
}
