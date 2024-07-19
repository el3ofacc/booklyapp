import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Transportation {
  static navigate(BuildContext context,var Page) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Page()));
  }
}
