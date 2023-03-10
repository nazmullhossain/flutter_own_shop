
import 'package:flutter/material.dart';
import 'package:flutter_ecomer_riv/pages/search_page.dart';
import 'package:flutter_ecomer_riv/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../const/global_varriable.dart';
import '../widgets/addres_box_widgets.dart';
import '../widgets/carousel_widgets.dart';
import '../widgets/deal_of_day.dart';
import '../widgets/top_catagory_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void navigateToSearchScreen(String query){
    Navigator.pushNamed(context, SearchPage.routeName,arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          children: const [
            AddressBoxWidget(),
            SizedBox(height: 10,)
            ,TopCatagoryWidget(),
            SizedBox(height: 10,),
            CarouselWidget(),
            // SizedBox(height: 18,),
            DealOfDayWidget()
          ],
        ),
      ),
    );
  }
}
