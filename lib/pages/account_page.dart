import 'package:flutter/material.dart';
import 'package:flutter_ecomer_riv/const/global_varriable.dart';

import '../widgets/bellow_app_widgets.dart';
import '../widgets/top_button_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradiant
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                
                alignment: Alignment.topLeft,
                child: Image.asset("images/daraz.png",
                width: 120,height: 45,),
                
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,

                ),
                child: Row(
                  children: [
                   Padding(padding: EdgeInsets.only(right: 15),
                   child: Icon(Icons.notifications_outlined),),
                    Icon(Icons.search)
                  ],
                ),
              )
            ],
          ),
        ),
      ) ,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BellowAppBarWidget(),
          SizedBox(height: 10,),
          TopButtonWidget(),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
