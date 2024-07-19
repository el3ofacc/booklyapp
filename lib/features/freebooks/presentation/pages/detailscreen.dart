import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:free_book/features/freebooks/data/datasources/apiservices.dart';
import 'package:free_book/features/freebooks/presentation/provider/counter.dart';
import 'package:provider/provider.dart';

class Detailscreen extends StatelessWidget {
  Detailscreen(
      {super.key,
      required this.mydescriptoin,
      required this.mytitle,
      required this.myimage});
  final String myimage;
  final String mytitle;
  final String mydescriptoin;
  var element = Apiservices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: NetworkImage(myimage),
              height: 300,
              width: 200,
              fit: BoxFit.cover,
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(mytitle),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(mydescriptoin),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.share),
                ),
                Consumer<Counter>(
                  builder: (context, provider, child) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              provider.increase();
                              provider.toggle();
                              provider.decrease();
                            },
                            child: Icon(
                              Icons.shopping_cart,
                              color:
                                  !provider.clicked ? Colors.black : Colors.red,
                            ),
                          ),
                        ),
                        Text(provider.counter.toString())
                      ],
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
