import 'dart:async';

import 'package:flutter/material.dart';
import '../null_types.dart';

class ProductPage extends StatelessWidget {
  final Nullable<String> _title;
  final Nullable<double> _price;
  final Nullable<String> _description;
  final Nullable<String> _imageUrl;

  ProductPage({
    @required String title,
    @required double price,
    @required String description,
    @required String imageUrl,
  })  : _title = Nullable(it: title, fallback: "Null title",),
        _price = Nullable(it: price, fallback: 0.00,),
        _description = Nullable(it: description, fallback: "Null description"),
        _imageUrl = Nullable(it: imageUrl, fallback: "",);

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
            Image.asset(_imageUrl.getIt()),
            Container(
              padding: EdgeInsets.all(10.00),
              child: Text(_title.getIt()),
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
