import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final void Function(Map<String, dynamic>) addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue;
  String _descriptionValue;
  double _priceValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Product Title',
            ),
            onChanged: (String title) {
              setState(() {
                _titleValue = title;
              });
            },
          ),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(labelText: 'Product Description'),
            onChanged: (desc) {
              setState(() {
                _descriptionValue = desc;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Product Price'),
            keyboardType: TextInputType.number,
            onChanged: (price) => setState(
                  () => _priceValue = double.parse(price),
                ),
          ),
          SizedBox(height: 20.0,),
          RaisedButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            onPressed: () {
              final product = <String, dynamic>{
                'title': _titleValue,
                'description': _descriptionValue,
                'price': _priceValue,
                'image': 'assets/food.jpg',
              };
              widget.addProduct(product);
              Navigator.pushReplacementNamed(context, '/products');
            },
            child: Text('Save'),
          )
        ],
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
