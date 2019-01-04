import 'package:flutter/material.dart';

import '../null_types.dart';
import 'product_edit.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, MutableNonNull<dynamic>>> products;
  final void Function(int index, Map<String, MutableNonNull<dynamic>>)
      updateProduct;

  ProductListPage(this.products, this.updateProduct);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: 30),
          child: ListTile(
            leading: Image.asset(
              products[index]['image'].getIt() as String,
              width: 50,
              height: 50,
            ),
            title: Text(
              products[index]['title'].getIt() as String,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).push<void>(
                    MaterialPageRoute(
                      builder: (context) {
                        return ProductEditPage(
                          index: index,
                          product: products[index],
                          updateProduct: updateProduct,
                        );
                      },
                    ),
                  );
                }),
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
