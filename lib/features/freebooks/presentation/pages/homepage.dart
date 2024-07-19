import 'package:flutter/material.dart';

import 'package:free_book/features/freebooks/data/datasources/apiservices.dart';
 
import 'package:free_book/features/freebooks/presentation/provider/mycatagory.dart';

import 'package:free_book/features/freebooks/presentation/widgets/buildfuture.dart';
import 'package:free_book/features/freebooks/presentation/widgets/buildfuturvertical.dart';
import 'package:free_book/features/freebooks/presentation/widgets/dropbutton.dart';
import 'package:free_book/features/freebooks/presentation/widgets/mytextform.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var element = Apiservices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
           
            
         
        appBar: AppBar(
        actions: [ 
        Dropbutton()
        ],
        ),
        body: ListView(
          children: [
           
              Buildfuture(),
           
            SizedBox(
              height: 10,
            ),
            // Mytextform(),
             
              Buildfuturvertical(),
           
          ],
        ));
  }
}
