import 'package:flutter/material.dart';
import 'package:flutter_ecomer_riv/pages/product_details_page.dart';
import 'package:flutter_ecomer_riv/widgets/addres_box_widgets.dart';
import 'package:flutter_ecomer_riv/widgets/loading_widget.dart';

import '../const/global_varriable.dart';
import '../models/product_models.dart';
import '../services/search_services.dart';
import '../widgets/search_product_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key,required this.searchQuery}) : super(key: key);
  static const String routeName="/search";
  final String searchQuery;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchServices searchService=SearchServices();
  List<Product>?products;
  @override
  void initState() {
    // TODO: implement initState
    fetchSearchedProduct();
    super.initState();
  }
  fetchSearchedProduct()async{
    products=await searchService.fetchSearchedProduct(context: context, searchQuery: widget.searchQuery);
    setState(() {

    });
  }
  void navigateToSearchScreen(String query){
    Navigator.pushNamed(context, SearchPage.routeName,arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return products==null?LoadingWidget(): Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: GlobalVariables.appBarGradiant),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                    height: 42,
                    margin: EdgeInsets.only(left: 15),
                    child: Material(
                      borderRadius: BorderRadius.circular(7),
                      elevation: 1,
                      child: TextFormField(
                        onFieldSubmitted: navigateToSearchScreen,
                        decoration: InputDecoration(
                            prefixIcon: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.only(left: 6),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                  size: 23,
                                ),
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.only(top: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(7)
                              ),
                              borderSide: BorderSide.none,

                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),

                              ),
                              borderSide: BorderSide(
                                  color: Colors.black38,
                                  width: 1
                              ),
                            ),
                            hintText: "Search our Product",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17
                            )
                        ),

                      ),
                    )),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.mic,
                  color: Colors.black,
                  size: 25,),
              )

            ],
          ),
        ),
      ),
      body: Column(
        children: [
        AddressBoxWidget(),
          SizedBox(height: 10,),
          Expanded(
              child: ListView.builder(
                  itemCount: products!.length,
                  itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, ProductDetailsPage.routeName,arguments: products![index]);
                  },
                  child: SearchProductWidget(product: products![index],)),
            );
          }))
        ],
      )
    );
  }
}
