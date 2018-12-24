import 'package:flutter/material.dart';

import '../null_types.dart';

class ProductCreatePage extends StatefulWidget {
  final void Function(Map<String, NonNull<dynamic>>) addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  final _titleValue = NonNull(it: "Product");
  final _descriptionValue = NonNull(it: "Gotta love this product!", emptyStringIsNull: true);
  final _priceValue = NonNull(it: 0.00);
  final _formKey = GlobalKey<FormState>();

  double get targetPadding {
    final deviceWidth = MediaQuery.of(context).size.width;
    final targetWidth =
        deviceWidth > 550.0 ? deviceWidth * .85 : deviceWidth * .95;
    return (deviceWidth - targetWidth) / 2;
  }

  void _submit() {
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final product = <String, NonNull<dynamic>>{
        'title': _titleValue,
        'description': _descriptionValue,
        'price': _priceValue,
        'image': NonNull<String>(it: 'assets/food.jpg'),
      };
      widget.addProduct(product);
      Navigator.pushReplacementNamed(context, '/products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
//      autovalidate: true,
      child: Container(
        margin: EdgeInsets.all(15),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: targetPadding),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Product Title',
              ),
              validator: (value) {
                if(value.isEmpty){
                  return 'Title is required!';
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  _titleValue.setIt(value, ifItsNull: "Well shit....");
                });
              },
            ),
            TextFormField(
              maxLines: 4,
              decoration: InputDecoration(labelText: 'Product Description'),
              onSaved: (value) {
                setState(() {
                  _descriptionValue.setIt(value);
                });
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Product Price'),
              keyboardType: TextInputType.number,
              onSaved: (value) {
                setState(() {
                  _priceValue.setIt(double.parse(value), ifItsNull: 0.0);
                });
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
//            color: Theme.of(context).accentColor,
              textColor: Colors.white,
              onPressed: _submit,
              child: Text('Save'),
            ),
//          GestureDetector(
//            onTap: _submit,
//            child: Container(
//              color: Colors.green,
//              padding: EdgeInsets.all(5.0),
//              child: Text("My Button"),
//            ),
//          ),
          ],
        ),
      ),
    );
//    return Center(
//      child: RaisedButton(
//        child: Text('Create a Product'),
//        onPressed: () {
//          showModalBottomSheet<void>(
//            context: context,
//            builder: (context) {
//              return Center(
//                child: Text('This is a modal!'),
//              );
//            },
//          );
//        },
//      ),
//    );
  }
}
