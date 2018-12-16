import 'package:flutter/material.dart';

import 'products.dart';
import 'product_create.dart';
import 'product_list.dart';

class ProductAdminPage extends StatelessWidget {
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
                title: Text('Products List'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
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
            ProductCreatePage(),
            ProductListPage(),
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
