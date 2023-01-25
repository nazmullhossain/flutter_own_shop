import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecomer_riv/const/global_varriable.dart';
import 'package:flutter_ecomer_riv/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../pages/account_page.dart';
import '../pages/home_pages.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key}) : super(key: key);
static const String routeName="/actual-home";
  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int _page=0;
  double bottomBarWidth=42;
  double bottomBarBorderWidth=5;
  List<Widget> pageMain=[
    HomePage(),
    AccountPage(),
    Center(child: Text("cart Page"),),

  ];
  void updatePage(int page){
 setState(() {
   _page=page;
 });
  }
  @override
  Widget build(BuildContext context) {
    final userCartLen=context.watch<UserProvider>().user.cart.length;
    return Scaffold(


      bottomNavigationBar: BottomNavigationBar(
currentIndex: _page,
        onTap: updatePage,
        selectedItemColor: GlobalVariables.selectedNavBarColor,
        unselectedItemColor: GlobalVariables.unSelectedNavBarColor,
      backgroundColor: GlobalVariables.backGroundColor,
        iconSize: 28,
          items: [
            BottomNavigationBarItem(icon: Container(
              width:bottomBarWidth ,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page==0?
                        GlobalVariables.selectedNavBarColor
                        : GlobalVariables.backGroundColor,
                    width: bottomBarBorderWidth,

                  )
                )
              ),
              child: Icon(Icons.home_outlined),
            ),
              label: "Home"
            ),


            BottomNavigationBarItem(icon: Container(
              width:bottomBarWidth ,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                        color: _page==1?
                        GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backGroundColor,
                        width: bottomBarBorderWidth,

                      )
                  )
              ),
              child: Icon(Icons.person),
            ),
                label: "Profile"
            ),

            BottomNavigationBarItem(icon: Container(
              width:bottomBarWidth ,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                        color: _page==2?
                        GlobalVariables.selectedNavBarColor
                            : GlobalVariables.backGroundColor,
                        width: bottomBarBorderWidth,

                      )
                  )
              ),
              child: Badge(
                elevation: 0,
                  badgeContent: Text(userCartLen.toString()),
                  badgeColor: Colors.red,
                  child: Icon(Icons.shopping_bag_outlined)),
            ),
                label: "Cart"
            ),

          ],
      ),
      body: pageMain[_page],
    );
  }
}
