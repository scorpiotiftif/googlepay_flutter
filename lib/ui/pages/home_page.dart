import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:googlepay_flutter/ui/data/product.dart';

import 'info_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(products.length, (index) {
            return GestureDetector(
              child: material.Card(
                child: Stack(children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Image.network(
                      products[index].imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        products[index].name,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoScreen(products[index]),
                  ),
                );
              },
            );
          }),
        ));
  }
}