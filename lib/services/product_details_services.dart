import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_ecomer_riv/const/error_handling.dart';
import 'package:flutter_ecomer_riv/const/global_varriable.dart';
import 'package:flutter_ecomer_riv/const/utils.dart';
import 'package:flutter_ecomer_riv/models/product_models.dart';
import 'package:flutter_ecomer_riv/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../models/user_models.dart';

class ProductDetailsService {
  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse("$uri/api/rate-product/"),
        headers: {
          "Content-Type": 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token
        },
        body: jsonEncode({
          "id": product.id!,
          "rating": rating,
        }),
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, "your rating succressfully added");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void addToCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(Uri.parse("$uri/api/add-to-cart/"),
          headers: {
            "Content-Type": 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token
          },
          body: jsonEncode({
            'id': product.id!,
          }));

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            User user =
                userProvider.user.copyWith(cart: jsonDecode(res.body)['cart']);
            userProvider.setUserFromModel(user);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
