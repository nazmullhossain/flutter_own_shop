
import 'package:flutter/material.dart';
import 'package:flutter_ecomer_riv/admin/pages/add_product_admin_page.dart';
import 'package:flutter_ecomer_riv/widgets/loading_widget.dart';

import '../../models/product_models.dart';
import '../../widgets/single_product_widget.dart';
import '../services/admin_services.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  // void deleteProduct(Product product, int index) {
  //   adminServices.deleteProduct(
  //     context: context,
  //     product: product,
  //     onSuccess: () {
  //       products!.removeAt(index);
  //       setState(() {});
  //     },
  //   );
  // }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductAdminPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const LoadingWidget()
        : Scaffold(
      body: GridView.builder(
        itemCount: products!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          final productData = products![index];
          return Column(
            children: [
              SizedBox(height: 15,),
              SizedBox(
                height: 150,
                child: SingleProduct(
                  image: productData.images[0],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          productData.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),

                        Text(
                     productData.price.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: const Icon(
                        Icons.delete_outline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: navigateToAddProduct,
        tooltip: 'Add a Product',
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
    );
  }
}