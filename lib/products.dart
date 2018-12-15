import 'package:flutter/material.dart';

import 'build_product_item.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final void Function(int) deleteProduct;

  Products(this.products, {this.deleteProduct});

  @override
  Widget build(BuildContext context) {
    return products.length > 0
        ? ListView.builder(
      itemBuilder: (_, index) =>
          BuildProductItem(
            products: products, index: index, deleteProduct: deleteProduct,),
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
