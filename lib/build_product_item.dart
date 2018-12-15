import 'package:flutter/material.dart';

import 'pages/product.dart';

class BuildProductItem extends StatelessWidget{
  final int index;
  final List<Map<String, String>> products;
  final void Function(int) deleteProduct;

  const BuildProductItem({@required this.products, @required this.index, @required this.deleteProduct});

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

}