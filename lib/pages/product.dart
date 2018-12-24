import 'dart:async';

import 'package:flutter/material.dart';
import '../null_types.dart';
import '../widgets/products/price_tag.dart';
import '../widgets/products/address_tag.dart';
import '../widgets/ui_elements/title_default.dart';

class ProductPage extends StatelessWidget {
  final NonNull<String> title;
  final NonNull<double> price;
  final NonNull<String> description;
  final Nullable<String> imageUrl;

  ProductPage({
    @required this.title,
    @required this.price,
    @required this.description,
    @required this.imageUrl,
  });

  String _actualImageUrl() {
    String url;
    imageUrl.getIt(
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
          title: Text(title.getIt()),
        ),
        body: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
//              margin: EdgeInsets.only(bottom: 50,),
              child: Image.asset(_actualImageUrl()),
            ),
            AddressTag(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TitleDefault(title.getIt()),
                SizedBox(
                  width: 50.0,
                ),
                PriceTag('${price.getIt().toString()}'),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              padding: EdgeInsets.all(10.00),
              alignment: Alignment.center,
              child: Text(
                description.getIt(),
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
