import 'package:flutter/material.dart';

import './products.dart';
import 'product_control.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, String>> products;
  final void Function(Map<String, String>) addProduct;
  final void Function(int) deleteProduct;

  ProductManager(this.products, this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(addProduct),
        ),
        Expanded( //use Container with the height named parameter for fixed size, Expanded is for dynamic size
          child: Products(products, deleteProduct: deleteProduct),
        ),
      ],
    );
  }
}
