import 'package:flutter/material.dart';

import 'product_card.dart';
import '../../models/product.dart';

class Products extends StatelessWidget {
  final List<Product> products;

  Products(this.products);

  @override
  Widget build(BuildContext context) {
    return products.length > 0
        ? ListView.builder(
      itemBuilder: (_, index) =>
          ProductCard(
            product: products[index], index: index,),
      itemCount: products.length,
    )
        : Center(
      child: Text("No products found, please add some."),
    );
//    return ListView(
//      children: products
//          .map(
//            (element) => Card(
//                  child: Column(
//                    children: [
//                      Image.asset('assets/food.jpg'),
//                      Text(element),
//                    ],
//                  ),
//                ),
//          )
//          .toList(),
//    );
  }
}
