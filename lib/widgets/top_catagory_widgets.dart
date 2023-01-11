import 'package:flutter/material.dart';
import 'package:flutter_ecomer_riv/const/global_varriable.dart';

class TopCatagoryWidget extends StatelessWidget {
  const TopCatagoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
   child: ListView.builder(
     itemExtent: 75,
     scrollDirection: Axis.horizontal,
     itemCount: GlobalVariables.categoryImages.length,
       itemBuilder: (context,index){
     return Column(
       children: [
         Container(
           padding: EdgeInsets.symmetric(
             horizontal: 10
           ),
           child: ClipRRect(
             borderRadius: BorderRadius.circular(50),
             child: Image.asset(GlobalVariables.categoryImages[index]['image']!,
             fit: BoxFit.cover,
             height: 40,
                 width: 40,),
           ),
         ),
         Text(GlobalVariables.categoryImages[index]['title']!,
         style: TextStyle(
           fontSize: 12,
           fontWeight: FontWeight.w400
         ),)
       ],
     );
   }),

    );
  }
}
