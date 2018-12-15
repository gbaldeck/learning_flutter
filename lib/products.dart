import 'package:flutter/material.dart';

import 'pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final void Function(int) deleteProduct;

  Products(this.products, {this.deleteProduct});

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: [
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                color: Theme.of(context).accentColor,
                child: Text('Details'),
                onPressed: () => Navigator.push<bool>(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ProductPage(
                              title: products[index]['title'],
                              imageUrl: products[index]['image'],
                            ),
                      ),
                    ).then(
                      (bool value) {
                        if(value){
                          deleteProduct(index);
                        }
                      },
                    ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return products.length > 0
        ? ListView.builder(
            itemBuilder: _buildProductItem,
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
