import 'package:flutter/material.dart';

import 'price_tag.dart';
import '../ui_elements/title_default.dart';
import 'address_tag.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int index;

  const ProductCard({@required this.product, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(product['image'] as String),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TitleDefault(product['title'] as String),
                SizedBox(
                  width: 8.0,
                ),
                PriceTag(product['price'].toString()),
              ],
            ),
          ),
          AddressTag(),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.info),
                color: Theme.of(context).accentColor,
                onPressed: () => Navigator.pushNamed<bool>(
                            context, '/product/' + index.toString())
                        .then(
                      (bool value) {
                        if (value) {
//                          deleteProduct(index);
                        }
                      },
                    ),
              ),
//              SizedBox(width: 5.0,),
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.red,
                onPressed: () => Navigator.pushNamed<bool>(
                    context, '/product/' + index.toString())
                    .then(
                      (bool value) {
                    if (value) {
//                          deleteProduct(index);
                    }
                  },
                ),
              ),
//              FlatButton(
//                color: Theme.of(context).accentColor,
//                child: Text('Details'),
//                onPressed: () => Navigator.pushNamed<bool>(
//                            context, '/product/' + index.toString())
//                        .then(
//                      (bool value) {
//                        if (value) {
////                          deleteProduct(index);
//                        }
//                      },
//                    ),
//              )
            ],
          ),
        ],
      ),
    );
  }
}
