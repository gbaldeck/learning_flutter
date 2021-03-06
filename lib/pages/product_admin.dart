import 'package:flutter/material.dart';

import 'product_edit.dart';
import 'product_list.dart';
import '../models/product.dart';

class ProductAdminPage extends StatelessWidget {
  final void Function(Product) addProduct;
  final void Function(int index, Product) updateProduct;
  final void Function(int) deleteProduct;
  final List<Product> products;

  ProductAdminPage(this.products, this.addProduct, this.updateProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                //disable hamburger icon in app bar
                automaticallyImplyLeading: false,
                title: Text('Choose'),
              ),
              ListTile(
                leading: Icon(Icons.shop),
                title: Text('Products List'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/products');
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Product Admin'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.ac_unit),
                text: "Create Product",
              ),
              Tab(
                icon: Icon(Icons.whatshot),
                text: 'My Products',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductEditPage(addProduct: addProduct,),
            ProductListPage(products, updateProduct, deleteProduct),
          ],
        ),
      ),
//        bottomNavigationBar: BottomNavigationBar(
//          items: <BottomNavigationBarItem>[
//            BottomNavigationBarItem(
//              icon: Icon(Icons.hot_tub),
//              title: Text("Create Product"),
//            ),
//            BottomNavigationBarItem(
//              icon: Icon(Icons.business_center),
//              title: Text("My Products"),
//            ),
//          ],
//        ),
    );
  }
}
