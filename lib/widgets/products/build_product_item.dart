import 'package:flutter/material.dart';

class BuildProductItem extends StatelessWidget {
  final int index;
  final List<Map<String, dynamic>> products;

  const BuildProductItem({@required this.products, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(products[index]['image'] as String),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  products[index]['title'] as String,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Oswald',
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Container(
                  child: Text(
                    '\$${products[index]['price'].toString()}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.0,
                    vertical: 2.5,
                  ),
                ),
              ],
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(6.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 6.0,
                vertical: 2.5,
              ),
              child: Text('Union Square, San Francisco'),
            ),
          ),
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
