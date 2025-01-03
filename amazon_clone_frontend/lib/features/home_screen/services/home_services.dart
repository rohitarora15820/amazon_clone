import 'dart:convert';
import 'dart:developer';

import 'package:amazon_clone_frontend/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../constants/error_handling.dart';
import '../../../constants/global_variables.dart';
import '../../../constants/utils.dart';
import '../../../providers/user_provider.dart';

class HomeServices {
  Future<List<ProductModel>> fetchCategoryProducts(
      {required BuildContext context,  required String category}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false).user;
    List<ProductModel> productList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$apiPath/api/products?category=$category'), headers: {
        'Content-Type': 'application/json; charset=utf-8',
        "x-auth-token": userProvider.token
      });

      log("response" + res.toString());

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              productList.add(
                  ProductModel.fromJson(jsonEncode(jsonDecode(res.body)[i])));
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }
}
