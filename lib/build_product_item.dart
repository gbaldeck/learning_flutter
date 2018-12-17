import 'package:flutter/material.dart';

class BuildProductItem extends StatelessWidget {
  final int index;
  final List<Map<String, dynamic>> products;

  const BuildProductItem(
      {@required this.products,
      @required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(products[index]['image'] as String),
          Text(products[index]['title'] as String),
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
//                          deleteProduct(index);
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
