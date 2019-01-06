import 'dart:async';
import 'package:flutter/material.dart';

import '../widgets/products/address_tag.dart';
import '../widgets/products/price_tag.dart';
import '../widgets/ui_elements/title_default.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final double price;
  final String description;
  final String imageUrl;

  ProductPage({
    @required this.title,
    @required this.price,
    @required this.description,
    @required this.imageUrl,
  });

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
          title: Text(title),
        ),
        body: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
//              margin: EdgeInsets.only(bottom: 50,),
              child: Image.asset(imageUrl),
            ),
            AddressTag(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TitleDefault(title),
                SizedBox(
                  width: 50.0,
                ),
                PriceTag('${price.toString()}'),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              padding: EdgeInsets.all(10.00),
              alignment: Alignment.center,
              child: Text(
                description,
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
