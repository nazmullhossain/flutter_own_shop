import 'package:flutter/material.dart';
import 'package:flutter_ecomer_riv/const/global_varriable.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarWidget extends StatelessWidget {
  const StarWidget({Key? key,required this.rating}) : super(key: key);
  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
        initialRating: 3,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
      itemSize: 15,

      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
