import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

import 'pages/product.dart';
import 'pages/product_admin.dart';
import 'pages/products.dart';

void main() {
//  debugPaintSizeEnabled = true;
//  debugPaintBaselinesEnabled = true;
//  debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

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
        '/': (context) => ProductsPage(_products),
        '/admin': (context) => ProductAdminPage(_addProduct, _deleteProduct),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') return null;

        if (pathElements[1] == 'product') {
          final index = int.parse(pathElements[2]);

          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                  title: _products[index]['title'] as String,
                  imageUrl: _products[index]['image'] as String,
                ),
          );
        }
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return ProductsPage(_products,);
          },
        );
      },
    );
  }
}
