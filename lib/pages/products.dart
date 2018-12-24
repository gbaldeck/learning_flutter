import 'package:flutter/material.dart';

import '../widgets/products/products.dart';
import '../null_types.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String, MutableNonNull<dynamic>>> products;

  ProductsPage(this.products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              //disable hamburger icon in app bar
              automaticallyImplyLeading: false,
              title: Text('Choose'),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Manage Products'),
              onTap: () {
                Navigator.pushReplacementNamed<void, void>(context, '/admin');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('EasyList'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          )
        ],
      ),
      body: Products(products),
    );
  }
}
