import 'package:flutter/material.dart';

import 'account_button_widget.dart';

class TopButtonWidget extends StatelessWidget {
   TopButtonWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
          AccountButton(onTap: (){}, text: "Your orders"),
          AccountButton(onTap: (){}, text: "Turn Seller"),
          ],
        ),
SizedBox(height: 10,),
        Row(
          children: [
          AccountButton(onTap: (){}, text: "Log Out"),
          AccountButton(onTap: (){}, text: "Your Wish List"),
          ],
        ),
      ],
    );
  }
}
