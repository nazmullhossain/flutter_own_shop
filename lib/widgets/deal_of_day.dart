import 'package:flutter/material.dart';

class DealOfDayWidget extends StatelessWidget {
  const DealOfDayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            left: 10,
            top: 15
          ),
          child: Text("Deal of the day",style: TextStyle(
            fontSize: 20
          ),),
        ),
Image.network("https://static-01.daraz.com.bd/p/e6b7fa33ea9cb948a4b8539c54397ab0.png_200x200q80-product.jpg_.webp",
fit: BoxFit.fitHeight,
width: 235,),
Container(
  padding: EdgeInsets.only(left: 15),
  alignment: Alignment.topLeft,
  child: Text("100 TK",
  style: TextStyle(
    fontSize: 18,

  ),),
)

        ,Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            left: 15,
            top: 5,
            right: 40
          ),
          child: Text("Shee",maxLines: 2,
          overflow: TextOverflow.ellipsis,),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
Image.network("https://static-01.daraz.com.bd/p/e6b7fa33ea9cb948a4b8539c54397ab0.png_200x200q80-product.jpg_.webp",fit: BoxFit.fitHeight,width: 100,height: 100,),
Image.network("https://static-01.daraz.com.bd/p/e6b7fa33ea9cb948a4b8539c54397ab0.png_200x200q80-product.jpg_.webp",fit: BoxFit.fitHeight,width: 100,height: 100,),
Image.network("https://static-01.daraz.com.bd/p/e6b7fa33ea9cb948a4b8539c54397ab0.png_200x200q80-product.jpg_.webp",fit: BoxFit.fitHeight,width: 100,height: 100,),
Image.network("https://static-01.daraz.com.bd/p/e6b7fa33ea9cb948a4b8539c54397ab0.png_200x200q80-product.jpg_.webp",fit: BoxFit.fitHeight,width: 100,height: 100,),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,

          padding: EdgeInsets.symmetric(
          vertical: 15,

        ).copyWith(left: 15),
        child: Text("See all deals",
        style: TextStyle(
          color: Colors.cyan[800],

        ),),
        )
      ],
    );
  }
}
