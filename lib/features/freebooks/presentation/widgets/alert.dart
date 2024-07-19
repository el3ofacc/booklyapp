import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Alert extends StatelessWidget {
    Alert({super.key,required this.message});
  String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(message),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("ok"))
      ],
    );
  }
}
