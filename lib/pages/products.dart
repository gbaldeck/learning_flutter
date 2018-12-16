import 'package:flutter/material.dart';

import '../product_manager.dart';
import 'product_admin.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String, String>> products;
  final void Function(Map<String, String>) addProduct;
  final void Function(int) deleteProduct;

  ProductsPage(this.products, this.addProduct, this.deleteProduct);

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
              title: Text('Manage Products'),
              onTap: () {
                Navigator.pushReplacementNamed<void,void>(context, '/admin');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('EasyList'),
      ),
      body: ProductManager(products, addProduct, deleteProduct),
    );
  }
}
