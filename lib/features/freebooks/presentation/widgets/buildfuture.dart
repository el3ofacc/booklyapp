import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:free_book/core/utils/appcolor.dart';
import 'package:free_book/core/utils/error/failure.dart';
import 'package:free_book/features/freebooks/data/datasources/apiservices.dart';
import 'package:free_book/features/freebooks/data/models/booksmodel.dart';
import 'package:provider/provider.dart';
 

class Buildfuture extends StatelessWidget {
  Buildfuture({
    super.key,
 
  });

//   @override
//   State<Buildfuture> createState() => _BuildfutureState();
// }

// class _BuildfutureState extends State<Buildfuture> {
  var element = Apiservices();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: element.Getallbooks(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.fold(
                (Failure) =>
                    Center(child: Text("check your internet connection")),
                (data) => Container(
                  color: Appcolor().primarycolor,
      height: 150,width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: element.books.length, 
        itemBuilder: (context, index) {
          var iterator = element.books[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(image: NetworkImage(iterator.image.toString()),
              height: 150,
              width: 100,fit: BoxFit.cover,),
            ),
          );
        },
      ),
    ));
          } else if (snapshot.hasError) {
            return Text("snapshot.error.toString()");
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Text('check your internet connection');
          }
        });
  }
}
