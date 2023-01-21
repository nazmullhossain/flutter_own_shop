import 'package:flutter/material.dart';
import 'package:flutter_ecomer_riv/widgets/loading_widget.dart';

import '../const/global_varriable.dart';
import '../models/product_models.dart';
import '../services/home_services.dart';

// class CatagoryDealsPage extends StatefulWidget {
//   const CatagoryDealsPage({Key? key,required this.category}) : super(key: key);
// final String category;
// static const String routeName="/catagory-deals";
//   @override
//   State<CatagoryDealsPage> createState() => _CatagoryDealsPageState();
// }
//
// class _CatagoryDealsPageState extends State<CatagoryDealsPage> {
// List<Product>?productList;
//  final HomeService homeService=HomeService();
//
//  @override
//   void initState() {
//     // TODO: implement initState
//    fetchCategoryProducts();
//     super.initState();
//   }
//  fetchCategoryProducts()async{
//    productList=await homeService.fetchCategoryProducts(context: context, category: widget.category);
//    setState(() {
//
//    });
//  }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(100),
//         child: AppBar(
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(gradient: GlobalVariables.appBarGradiant),
//           ),
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 alignment: Alignment.topLeft,
//
//               ),
//               Text(widget.category,style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black
//
//               ),)
//             ],
//           ),
//         ),
//       ),
//
//       body: productList==null?LoadingWidget():Column(
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
//             alignment: Alignment.topLeft,
//             child: Text("Keep shopping for ${widget.category}"),
//           ),
//          SizedBox(
//            height: 170,
//            child: GridView.builder(
//                itemCount: productList!.length,
//                padding: EdgeInsets.only(left: 10),
//                scrollDirection: Axis.horizontal,
//                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                crossAxisCount: 1,
//            childAspectRatio: 1.4,
//            mainAxisSpacing: 10), itemBuilder: (context,index){
//            final product=productList![index];
//              return Column(
//                children: [
//                  SizedBox(height: 130,
//                  child: DecoratedBox(
//                    decoration: BoxDecoration(
//                      border: Border.all(
//                        color: Colors.black12,
//                        width: 0.5
//                      )
//                    ),
//                    child: Padding(
//                      padding: EdgeInsets.all(10),
//                      child: Image.network(product.images[0]),
//                    ),
//                  ),
//                  ),
//                  Container(
//                    padding: EdgeInsets.only(
//                      left: 10,
//                      top: 5
//                    ),
//                    child: Text(product.name,maxLines: 2, overflow: TextOverflow.ellipsis,),
//                  )
//                ],
//              );
//            }),
//          )
//         ],
//       ),
//     );
//   }
// }
//
//
//


class CategoryDealsScreen extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;
  const CategoryDealsScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  List<Product>? productList;
  final HomeService homeServices = HomeService();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await homeServices.fetchCategoryProducts(
      context: context,
      category: widget.category,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:  BoxDecoration(
              gradient: GlobalVariables.appBarGradiant,
            ),
          ),
          title: Text(
            widget.category,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: productList == null
          ? const LoadingWidget()
          : Column(
        children: [
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            alignment: Alignment.topLeft,
            child: Text(
              'Keep shopping for ${widget.category}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 170,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 15),
              itemCount: productList!.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1.4,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final product = productList![index];
                return Column(
                  children: [
                    SizedBox(
                      height: 130,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                            width: 0.5,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.network(
                            product.images[0],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(
                        left: 0,
                        top: 5,
                        right: 15,
                      ),
                      child: Text(
                        product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}