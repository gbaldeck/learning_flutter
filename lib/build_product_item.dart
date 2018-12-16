import 'package:flutter/material.dart';

import 'pages/product.dart';

class BuildProductItem extends StatelessWidget {
  final int index;
  final List<Map<String, String>> products;
  final void Function(int) deleteProduct;

  const BuildProductItem(
      {@required this.products,
      @required this.index,
      @required this.deleteProduct});

  @override
  Widget build(BuildContext context) {
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
                onPressed: () => Navigator.pushNamed<bool>(
                            context, '/product/' + index.toString())
                        .then(
                      (bool value) {
                        if (value) {
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
}
