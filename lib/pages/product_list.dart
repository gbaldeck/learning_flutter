import 'package:flutter/material.dart';

import '../null_types.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, MutableNonNull<dynamic>>> products;

  ProductListPage(this.products);

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
            trailing: IconButton(icon: Icon(Icons.edit), onPressed: (){

            }),
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
