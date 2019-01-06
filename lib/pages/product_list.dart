import 'package:flutter/material.dart';

import '../models/product.dart';
import 'product_edit.dart';

class ProductListPage extends StatelessWidget {
  final List<Product> products;
  final void Function(int index, Product)
      updateProduct;
  final void Function(int) deleteProduct;

  ProductListPage(this.products, this.updateProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Dismissible(
//          margin: EdgeInsets.only(top: 20),
          key: Key(products[index].title),
          onDismissed: (direction) {
            if(direction == DismissDirection.endToStart){
              deleteProduct(index);
            }
          },
          background: Container(
            color: Colors.redAccent,
          ),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(
                    products[index].image,
//              width: 50,
//              height: 50,
                  ),
                ),
                title: Text(
                  products[index].title,
//              textAlign: TextAlign.center,
                ),
                subtitle:
                    Text('\$${products[index].price.toString()}'),
                trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).push<void>(
                        MaterialPageRoute(
                          builder: (context) {
                            return ProductEditPage(
                              index: index,
                              product: products[index],
                              updateProduct: updateProduct,
                            );
                          },
                        ),
                      );
                    }),
              ),
              Divider(),
            ],
          ),
        );
      },
      itemCount: products.length,
    );
  }
}
