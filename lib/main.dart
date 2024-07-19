import 'package:flutter/material.dart';
import 'package:free_book/core/utils/appthem.dart';
import 'package:free_book/features/freebooks/presentation/pages/homepage.dart';
import 'package:free_book/features/freebooks/presentation/provider/counter.dart';
import 'package:free_book/features/freebooks/presentation/provider/mycatagory.dart';
 
import 'package:provider/provider.dart';

 

void main() {
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ 
       
    ChangeNotifierProvider(create: (context)=>Mycatagory()),
    ChangeNotifierProvider(create: (context)=>Counter())  
   
        ],
    child: MaterialApp(
      theme: Appthem().mytheme,
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    ),);
  }
}