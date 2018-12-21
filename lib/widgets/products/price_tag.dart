import 'package:flutter/material.dart';

import '../../null_types.dart';

class PriceTag extends StatelessWidget {
  final NullFallback<String> _price;

  PriceTag(String price): _price = NullFallback(it: price, fallback: "\$0.00");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '\$${_price.getIt()}',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 5,
      ),
    );
  }
}