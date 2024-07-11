import 'dart:convert';
import 'dart:core';
import 'package:amazon_clone_node_js_flutter_app_new/constants/utils.dart';
import 'package:amazon_clone_node_js_flutter_app_new/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../constants/error_handling.dart';
import '../../../constants/global_variable.dart';
import '../../../models/product.dart';
import '../../../models/user.dart';

class ProductDetailsServices {
  void rateProduct({
    required BuildContext context,
    required Product product,
    required double rating,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/rate-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode(
          {'id': product.id!, 'rating': rating},
        ),
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          product = Product.fromJson(res.body);
        },
      );
    } catch (e) {}
  }

  void addToCart({
    required BuildContext context,
    required Product product,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/add-to-cart'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode(
          {
            'id': product.id!,
          },
        ),
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          //if you want to copy an object with
          //some parameters as different and other's as same we use the copywith
          //construtor
          User user = userProvider.user.copyWith(
            cart: jsonDecode(res.body)['cart'],
          );
          userProvider.setUserFromModel(user);
          showSnackBar(context, 'Successfully added !!');
        },
      );
    } catch (e) {}
  }
}
