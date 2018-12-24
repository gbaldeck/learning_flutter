import 'package:flutter/material.dart';

import 'product_card.dart';
import '../../null_types.dart';

class Products extends StatelessWidget {
  final List<Map<String, NonNull<dynamic>>> products;

  Products(this.products);

  @override
  Widget build(BuildContext context) {
    return products.length > 0
        ? ListView.builder(
      itemBuilder: (_, index) =>
          ProductCard(
            product: products[index], index: NonNull(it: index),),
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
