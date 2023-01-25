import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecomer_riv/models/product_models.dart';
import 'package:flutter_ecomer_riv/pages/catagory_deals_paeg.dart';
import 'package:flutter_ecomer_riv/pages/home_pages.dart';
import 'package:flutter_ecomer_riv/pages/product_details_page.dart';
import 'package:flutter_ecomer_riv/pages/search_page.dart';
import 'package:flutter_ecomer_riv/widgets/bottom_bar-widgets.dart';

import 'admin/pages/add_product_admin_page.dart';
import 'features/auth/auth_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch (routeSettings.name){
    case AuthScreen.routeName:
    return MaterialPageRoute(builder: (context)=>AuthScreen());

    case HomePage.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=>HomePage());

    case BottomBarWidget.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=>BottomBarWidget());

    case CategoryDealsScreen.routeName:
      var catagory=routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=>CategoryDealsScreen(category: catagory,));

//noted
    case ProductDetailsPage.routeName:
      var product=routeSettings.arguments as Product;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=>ProductDetailsPage( product: product,));


    case SearchPage.routeName:
      var serchQuery=routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=>SearchPage(searchQuery: serchQuery,));


    case AddProductAdminPage.routeName:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=>AddProductAdminPage());

    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=>Scaffold(
        body: Center(
          child: Text("Screen does not exit!"),
        ) ,
      ));
  }
}