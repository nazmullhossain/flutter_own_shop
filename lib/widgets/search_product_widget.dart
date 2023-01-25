import 'package:flutter/material.dart';
import 'package:flutter_ecomer_riv/widgets/start_widget.dart';

import '../models/product_models.dart';

class SearchProductWidget extends StatelessWidget {
  const SearchProductWidget({Key? key, required this.product})
      : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    double avgRating=0;
    double totalRating=0;

    for(int i=0; i<product.rating!.length;i++){
      totalRating+= product.rating![i].rating;

    }
    if(totalRating!=0){
avgRating=totalRating / product.rating!.length;
    }
    return Column(
      children: [
        Container(
          // width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image.network(
                product.images[0],
                fit: BoxFit.contain,
                height: 135,
                width: 135,
              ),
              Column(
                children: [
                  Container(
                      width: 170,
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                        product.name,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      )),
                  Container(
                      width: 170,
                      padding: EdgeInsets.only(left: 8, top: 5),
                      child:  StarWidget(
                        rating: avgRating,
                      )),
                  Container(
                      width: 170,
                      padding: EdgeInsets.only(left: 10, top: 5),
                      child: Text(
                       "Tk ${product.price}",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold

                        ),
                      )),

                  Container(
                      width: 170,
                      padding: EdgeInsets.only(left: 10, ),
                      child: Text(
                        "Eligible for FREE Shiping",
                        maxLines: 2,
                        style: TextStyle(


                        ),
                      )),

                  Container(
                      width: 170,
                      padding: const EdgeInsets.only(left: 10, ),
                      child: Text(
                        "In Stock",
                        maxLines: 2,
                        style: TextStyle(

                         color: Colors.teal


                        ),
                      )),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
