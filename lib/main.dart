import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

import 'pages/auth.dart';
import 'pages/product.dart';
import 'pages/product_admin.dart';
import 'pages/products.dart';
import 'null_types.dart';
import 'models/product.dart';

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
  List<Product> _products = [];

  void _addProduct(Product product) {
    setState(() {
      _products.add(product);
    });
  }

  void _updateProduct(int index, Product product) {
    setState(() {
      _products[index] = product;
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
        primarySwatch: Colors.teal,
        accentColor: Colors.tealAccent,
        buttonColor: Colors.tealAccent,
//        buttonTheme: ButtonThemeData(),
//        fontFamily: 'Oswald',
      ),
      //define the home property or the / route, can't use both
//      home: AuthPage(),
      routes: {
        //the / is a special route that is reserved for the home page
        '/': (context) => AuthPage(),
        '/products': (context) => ProductsPage(_products),
        '/admin': (context) => ProductAdminPage(_products, _addProduct, _updateProduct, _deleteProduct),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') return null;

        if (pathElements[1] == 'product') {
          final index = int.parse(pathElements[2]);

          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                  title: _products[index].title,
                  price: _products[index].price,
                  description: _products[index].description,
                  imageUrl: _products[index].image,
                ),
          );
        }
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(
          builder: (BuildContext context) {
            return ProductsPage(
              _products,
            );
          },
        );
      },
    );
  }
}
