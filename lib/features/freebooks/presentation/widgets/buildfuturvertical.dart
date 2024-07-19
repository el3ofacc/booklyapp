import 'package:flutter/material.dart';
import 'package:free_book/core/utils/appcolor.dart';
import 'package:free_book/core/utils/error/failure.dart';
import 'package:free_book/features/freebooks/data/datasources/apiservices.dart';
import 'package:free_book/features/freebooks/data/datasources/transportation.dart';
import 'package:free_book/features/freebooks/presentation/pages/detailscreen.dart';
import 'package:free_book/features/freebooks/presentation/widgets/alert.dart';

class Buildfuturvertical extends StatefulWidget {
  Buildfuturvertical({super.key});

  @override
  State<Buildfuturvertical> createState() => _BuildfuturverticalState();
}

class _BuildfuturverticalState extends State<Buildfuturvertical> {
  var element = Apiservices();
  //var aler = alert();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: element.Getmoresellerbooks(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.fold(
                (Failure) =>  Center(child: Text("check your internet connection")),
                (data) => Container(
                      height: 600,
                      child: ListView.builder(
                        itemCount: element.books.length,
                        itemBuilder: (context, index) {
                          var iterator = element.books[index];
                          return Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Transportation.navigate(
                                        context,
                                        () => Detailscreen(
                                              mydescriptoin: iterator
                                                  .descriptoin
                                                  .toString(),
                                              myimage:
                                                  iterator.image.toString(),
                                              mytitle:
                                                  iterator.title.toString(),
                                            ));
                                  },
                                  child: Container(
                                    height: 200,
                                    width: 250,
                                    child: ListTile(
                                      title: Text(
                                        "${iterator.title}",
                                        style: TextStyle(
                                            color: Appcolor().textcolor),
                                      ),
                                      subtitle: Text(
                                          iterator.descriptoin.toString(),
                                          style: TextStyle(
                                              color: Appcolor().textcolor)),
                                    ),
                                  ),
                                ),
                                Image(
                                  fit: BoxFit.cover,
                                  image:
                                      NetworkImage(iterator.image.toString()),
                                  height: 200,
                                  width: 120,
                                ),
                              ],
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
            return Text('error');
          }
        });
    ;
  }
}
