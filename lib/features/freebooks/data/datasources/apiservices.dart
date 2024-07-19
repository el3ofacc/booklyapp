// import 'package:dio/dio.dart';
// import 'package:free_book/features/freebooks/data/models/booksmodel.dart';

// class Apiservices {
//   Dio dio;
//   Apiservices(this.dio);
//   List<Booksmodel> bookslist = [];
//   Fetchdata(String endpoints) async {
//     final baseurl = 'https://www.googleapis.com/books/v1/';
//     var response = await dio.get('$baseurl$endpoints');
//     return response.data;
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:free_book/core/utils/error/failure.dart';
import 'package:free_book/features/freebooks/data/models/booksmodel.dart';
import 'package:free_book/features/freebooks/presentation/provider/mycatagory.dart';
import 'package:provider/provider.dart';

class Apiservices {
  List<Booksmodel> books = [];

  final baseurl =
      'https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&';
  @override
  Future<Either<Failure, List<Booksmodel>>> Getbooks(String url) async {
    try {
      var response = await http.get(Uri.parse(url));

      var jsonbody = jsonDecode(response.body)['items'] as List;
      if (jsonbody != null && jsonbody != '') {
        books = jsonbody.map((json) => Booksmodel.fromjson(json)).toList();
        return right(books);
      } else {
        return left(Serverfailure('server error try again'));
      }
    } catch (e) {
      return left(Networkfailure('check your internet connection'));
    }
  } 

  Future<Either<Failure, List<Booksmodel>>> Getallbooks(
      BuildContext context) async {
    return Getbooks(
        "${baseurl}q=${Provider.of<Mycatagory>(context, listen: false).Catagory}");
  }
    
  @override
  Future<Either<Failure, List<Booksmodel>>> Getmoresellerbooks(
      BuildContext context) {
    print(Provider.of<Mycatagory>(context, listen: false).Catagory);
    return Getbooks(
        "${baseurl}Sorting=newest20%&q=${Provider.of<Mycatagory>(context, listen: false).Catagory}");
  }
}
 