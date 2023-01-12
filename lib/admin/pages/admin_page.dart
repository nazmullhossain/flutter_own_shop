import 'package:flutter/material.dart';
import 'package:flutter_ecomer_riv/admin/pages/post_admin_page.dart';

import '../../const/global_varriable.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int _page=0;
  double bottomBarWidth=42;
  double bottomBarBorderWidth=5;
  List<Widget> pageMain=[
    PostAdminPage(),
    Center(child: Text("Analytics Page"),),
    Center(child: Text("cart Page"),),

  ];
  void updatePage(int page){
    setState(() {
      _page=page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: GlobalVariables.appBarGradiant),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "images/daraz.png",
                  width: 120,
                  height: 45,
                ),
              ),
           Text("Admin",style: TextStyle(
             fontWeight: FontWeight.bold,
             color: Colors.black

           ),)
            ],
          ),
        ),
      ),
      body: pageMain[_page],
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
            child: Icon(Icons.post_add_outlined),
          ),
              label: "Post"
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
            child: Icon(Icons.analytics_outlined),
          ),
              label: "Anylytics"
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
            child: Icon(Icons.all_inbox_outlined),
          ),
              label: "Orders"
          ),
        ],
      ),
    );
  }
}
