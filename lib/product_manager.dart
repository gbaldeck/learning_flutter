import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  ProductManager(this.products);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded( //use Container with the height named parameter for fixed size, Expanded is for dynamic size
          child: Products(products),
        ),
      ],
    );
  }
}
