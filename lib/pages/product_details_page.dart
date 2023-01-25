import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecomer_riv/models/product_models.dart';
import 'package:flutter_ecomer_riv/pages/search_page.dart';
import 'package:flutter_ecomer_riv/provider/user_provider.dart';
import 'package:flutter_ecomer_riv/widgets/custom_button_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../const/global_varriable.dart';
import '../services/product_details_services.dart';
import '../widgets/start_widget.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);
  static const String routeName = '/product-details';
  final Product product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  final ProductDetailsService productDetailsService=ProductDetailsService();
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchPage.routeName, arguments: query);
  }
  double avgRating=0;
  double myRating=0;

  @override
  void initState() {
    // TODO: implement initState
    double totalRating=0;
  for(int i=0; i<widget.product.rating!.length; i++){
    totalRating += widget.product.rating![i].rating;
   if(widget.product.rating![i].userId==Provider.of<UserProvider>(context,listen: false ).user.id){
myRating=widget.product.rating![i].rating;
   }
  }
  if(totalRating!=0){
    avgRating=totalRating/widget.product.rating!.length;
  }
    super.initState();
  }
  void addToCart(){
  productDetailsService.addToCart(context: context, product: widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(gradient: GlobalVariables.appBarGradiant),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                    height: 42,
                    margin: const EdgeInsets.only(left: 15),
                    child: Material(
                      borderRadius: BorderRadius.circular(7),
                      elevation: 1,
                      child: TextFormField(
                        onFieldSubmitted: navigateToSearchScreen,
                        decoration: InputDecoration(
                            prefixIcon: InkWell(
                              onTap: () {},
                              child: const Padding(
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
                            contentPadding: const EdgeInsets.only(top: 10),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                              borderSide:
                                  BorderSide(color: Colors.black38, width: 1),
                            ),
                            hintText: "Search our Product",
                            hintStyle: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17)),
                      ),
                    )),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(
                  Icons.mic,
                  color: Colors.black,
                  size: 25,
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.product.id!),
                  StarWidget(
                    rating: avgRating,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                widget.product.name,
                style: const TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CarouselSlider(
                  items: widget.product.images.map((e) {
                    return Builder(
                        builder: (BuildContext conext) => Image.network(
                              e,
                              fit: BoxFit.contain,
                              height: 200,
                            ));
                  }).toList(),
                  options: CarouselOptions(viewportFraction: 1, height: 300)),
            ),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                    text: "Deal Price: ",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                          text: "${widget.product.price}",
                          style: const TextStyle(
                              fontSize: 22,
                              color: Colors.red,
                              fontWeight: FontWeight.w500))
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.product.description),
            ),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomButtonWidget(text: "Buy Now", onTap: (){

              }),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomButtonWidget(
                color: const Color.fromRGBO(255, 216, 19, 1) ,
                  text: "Add to cart", onTap: (){
                addToCart();
              }),
            ),
            Container(height: 5,
            color: Colors.black12,),
            const Text("Rate the product",style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,

            ),),
           RatingBar.builder(
               initialRating: myRating,
               minRating: 1,
               direction: Axis.horizontal,
               allowHalfRating: true,
               itemCount: 5,
               itemPadding: const EdgeInsets.symmetric(horizontal: 4),
               itemBuilder: (context,index){
             return const Icon(Icons.star,
             color: GlobalVariables.secondaryColor,);
           }, onRatingUpdate: (rating){
             productDetailsService.rateProduct(context: context, product: widget.product, rating: rating);
           })
          ],
        ),
      ),
    );
  }
}
