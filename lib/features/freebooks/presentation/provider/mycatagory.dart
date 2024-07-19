import 'package:flutter/material.dart';

class Mycatagory extends ChangeNotifier {
  String? Catagory ;
  Changecatagory(String newcatagory) {
    Catagory = newcatagory;
    notifyListeners();
  } 
}
