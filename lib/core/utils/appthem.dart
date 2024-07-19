import 'package:flutter/material.dart';
import 'package:free_book/core/utils/appcolor.dart';

class Appthem {
     var mytheme = ThemeData( 
    textTheme: TextTheme( 
      bodyLarge: TextStyle( 
        overflow: TextOverflow.ellipsis,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Appcolor().primarycolor
      ),
      
    ),appBarTheme: AppBarTheme(color: Appcolor().appbarcolor),
    cardTheme: CardTheme(color: Appcolor().primarycolor),
    iconTheme: IconThemeData(color: Appcolor().iconcolor,
    size: 50)
  );
}
