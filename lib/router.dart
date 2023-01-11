import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecomer_riv/pages/home_pages.dart';
import 'package:flutter_ecomer_riv/widgets/bottom_bar-widgets.dart';

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