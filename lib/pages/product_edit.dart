import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductEditPage extends StatefulWidget {
  final void Function(Product) addProduct;
  final void Function(int index, Product) updateProduct;
  final Product product;
  final int index;

  ProductEditPage({this.addProduct, this.product, this.updateProduct, this.index});

  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  String _titleValue;
  String _descriptionValue;
  String _priceValue;
  final _formKey = GlobalKey<FormState>();

  double get targetPadding {
    final deviceWidth = MediaQuery.of(context).size.width;
    final targetWidth =
        deviceWidth > 550.0 ? deviceWidth * .85 : deviceWidth * .95;
    return (deviceWidth - targetWidth) / 2;
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      final product = Product(
        title: _titleValue,
        description: _descriptionValue,
        price: double.parse(_priceValue),
        image: 'assets/food.jpg',
      );
      if(widget.product == null)
        widget.addProduct(product);
      else
        widget.updateProduct(widget.index, product);
      Navigator.pushReplacementNamed(context, '/products');
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageContent = GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(
            FocusNode()); //dismisses keyboard when tap outside of box
      },
      child: Form(
        key: _formKey,
//      autovalidate: true,
        child: Container(
          margin: EdgeInsets.all(15),
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding),
            children: <Widget>[
              TextFormField(
                initialValue: widget.product?.title ?? '',
                decoration: InputDecoration(
                  labelText: 'Product Title',
                ),
                validator: (value) {
                  if (value.isEmpty || value.length < 5) {
                    return 'Title is required and should be 5+ characters long!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _titleValue = value;
                },
              ),
              TextFormField(
                initialValue: widget.product?.description ?? '',
                maxLines: 4,
                decoration: InputDecoration(labelText: 'Product Description'),
                validator: (value) {
                  if (value.isEmpty || value.length < 10) {
                    return 'Description is required and should be 10+ characters long!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _descriptionValue = value;
                },
              ),
              TextFormField(
                initialValue: widget.product?.price?.toString() ?? '',
                decoration: InputDecoration(labelText: 'Product Price'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty ||
                      !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
                    return 'Price is required and should be a number!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _priceValue = value;
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

    return widget.product == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Edit Product'),
            ),
            body: pageContent,
          );
  }
}
