import 'dart:async';

import 'package:flutter/material.dart';
import '../null_types.dart';
import '../widgets/products/price_tag.dart';

class ProductPage extends StatelessWidget {
  final NonNullable<String> _title;
  final NonNullable<double> _price;
  final NonNullable<String> _description;
  final Nullable<String> _imageUrl;

  ProductPage({
    @required String title,
    @required double price,
    @required String description,
    @required String imageUrl,
  })  : _title = NonNullable(it: title),
        _price = NonNullable(it: price),
        _description = NonNullable(it: description),
        _imageUrl = Nullable(it: imageUrl);

  String _actualImageUrl() {
    String url;
    _imageUrl.getIt(
      itsNotNull: (it) => url = it,
      itsNull: () => url = "Test",
    );
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(
          context,
          false,
        ); //manual pop, must turn off automatic pop on next line
        return Future.value(
          false,
        ); //to stop the automatic pop that happens when true
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(_title.getIt()),
        ),
        body: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
//              margin: EdgeInsets.only(bottom: 50,),
              child: Image.asset(_actualImageUrl()),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              margin: EdgeInsets.only(bottom: 20, top: 50),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text('Union Square, San Francisco'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  _title.getIt(),
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Oswald',
                  ),
                ),
                SizedBox(
                  width: 50.0,
                ),
                PriceTag('${_price.getIt().toString()}'),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              padding: EdgeInsets.all(10.00),
              alignment: Alignment.center,
              child: Text(
                _description.getIt(),
                textAlign: TextAlign.center,
              ),
            ),
//            Container(
//              padding: EdgeInsets.all(10.00),
//              child: RaisedButton(
//                color: Theme.of(context).accentColor,
//                child: Text('DELETE'),
//                onPressed: () {
//                  _showWarningDialog(context);
////                  return Navigator.pop(context, true);
//                },
//              ),
//            ),
          ],
        ),
      ),
    );
  }

//  void _showWarningDialog(BuildContext context){
//    showDialog<bool>(
//      context: context,
//      builder: (BuildContext context) {
//        return AlertDialog(
//          title: Text('Are you sure?'),
//          content: Text('This action cannot be undone!'),
//          actions: <Widget>[
//            FlatButton(
//              child: Text('CANCEL'),
//              onPressed: () {
//                Navigator.pop(context);
//              },
//            ),
//            FlatButton(
//              child: Text('CONTINUE'),
//              onPressed: () {
//                Navigator.pop(context);
//                Navigator.pop(context, true);
//              },
//            ),
//          ],
//        );
//      },
//    );
//  }
}
