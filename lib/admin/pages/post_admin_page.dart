import 'package:flutter/material.dart';

import 'add_product_admin_page.dart';

class PostAdminPage extends StatefulWidget {
  const PostAdminPage({Key? key}) : super(key: key);

  @override
  State<PostAdminPage> createState() => _PostAdminPageState();
}

class _PostAdminPageState extends State<PostAdminPage> {
  void navigateToAddProduct(){
    Navigator.pushNamed(context, AddProductAdminPage.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Products"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          navigateToAddProduct();
        },
        tooltip: "Add a Product",
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
