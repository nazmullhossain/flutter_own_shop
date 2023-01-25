import 'package:flutter/material.dart';
import 'package:flutter_ecomer_riv/models/product_models.dart';
import 'package:flutter_ecomer_riv/pages/product_details_page.dart';
import 'package:flutter_ecomer_riv/services/home_services.dart';
import 'package:flutter_ecomer_riv/widgets/loading_widget.dart';

class DealOfDayWidget extends StatefulWidget {
  const DealOfDayWidget({Key? key}) : super(key: key);

  @override
  State<DealOfDayWidget> createState() => _DealOfDayWidgetState();
}

class _DealOfDayWidgetState extends State<DealOfDayWidget> {
  Product? product;
  HomeService homeService = HomeService();
  @override
  void initState() {
    // TODO: implement initState
    fetchProduct();
    super.initState();
  }

  fetchProduct() async {
    product = await homeService.fetchDealOfDay(context: context);
    setState(() {});
  }
void navigateToDetailsPage(){
    Navigator.pushNamed(context, ProductDetailsPage.routeName,arguments: product);
}
  @override
  Widget build(BuildContext context) {
    return product == null
        ? const LoadingWidget()
        : product!.name.isEmpty
            ? const Center(
                child: Text("No Product"),
              )
            : GestureDetector(
      onTap: (){
        navigateToDetailsPage();
      },
              child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 10, top: 15),
                      child: const Text(
                        "Deal of the day",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Image.network(
                      product!.images[0],
                      fit: BoxFit.fitHeight,
                      width: 235,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "100 TK",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
                      child: const Text(
                        "Shee",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: product!.images
                              .map((e) => Image.network(
                                    e,
                                    fit: BoxFit.fitWidth,
                                    width: 100,
                                    height: 100,
                                  ))
                              .toList()),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ).copyWith(left: 15),
                      child: Text(
                        "See all deals",
                        style: TextStyle(
                          color: Colors.cyan[800],
                        ),
                      ),
                    )
                  ],
                ),
            );
  }
}
