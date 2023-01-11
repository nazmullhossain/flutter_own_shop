import 'package:flutter/material.dart';
import 'package:flutter_ecomer_riv/const/global_varriable.dart';
import 'package:flutter_ecomer_riv/provider/user_provider.dart';
import 'package:provider/provider.dart';

class BellowAppBarWidget extends StatelessWidget {
  const BellowAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user=Provider.of<UserProvider>(context).user;
    return Container(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10
      ),
      decoration: BoxDecoration(
        gradient: GlobalVariables.appBarGradiant,

      ),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: "Hellow, ",style: TextStyle(
              fontSize: 22,
              color: Colors.black,


            ),
                children: [
TextSpan(
  text: user.name,
  style: TextStyle(
    fontSize: 22,
    color: Colors.black,
    fontWeight: FontWeight.bold
  )
)
                ]

            ),
          ),
        ],
      ),
    );
  }
}
