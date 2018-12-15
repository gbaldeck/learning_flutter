import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

import 'pages/auth.dart';
import 'pages/product_admin.dart';
import 'pages/products.dart';

void main() {
//  debugPaintSizeEnabled = true;
//  debugPaintBaselinesEnabled = true;
//  debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      debugShowMaterialGrid: true,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.indigoAccent,
      ),
      //define the home property or the / route, can't use both
//      home: AuthPage(),
      routes: {
        //the / is a special route that is reserved for the home page
        '/': (context) => ProductsPage(),
        '/admin': (context) => ProductAdminPage(),
      },
    );
  }
}
