import 'package:flutter/material.dart';
import 'package:free_book/features/freebooks/data/datasources/apiservices.dart';
import 'package:free_book/features/freebooks/data/datasources/transportation.dart';
import 'package:free_book/features/freebooks/presentation/pages/homepage.dart';
import 'package:free_book/features/freebooks/presentation/provider/mycatagory.dart';
import 'package:provider/provider.dart';

class Dropbutton extends StatefulWidget {
  const Dropbutton({super.key});

  @override
  State<Dropbutton> createState() => _DropbuttonState();
}

class _DropbuttonState extends State<Dropbutton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      hint: Text('select book'),
      onChanged: (value) {
        Provider.of<Mycatagory>(context, listen: false)
            .Changecatagory(value.toString());
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Homepage()));
      },
      items: [
        DropdownMenuItem(
          child: Text('math'),
          value: 'math',
        ),
        DropdownMenuItem(
          child: Text('science'),
          value: 'science',
        ),
        DropdownMenuItem(
          child: Text('cook'),
          value: 'cook',
        ),
        DropdownMenuItem(
          child: Text('chemistry'),
          value: 'chemstry',
        ),
        DropdownMenuItem(
          child: Text('biology'),
          value: 'biology',
        ),
        DropdownMenuItem(
          child: Text('computer science'),
          value: 'computerscience',
        ),
      ],
    );
    ;
  }
}
