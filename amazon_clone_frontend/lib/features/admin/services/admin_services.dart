import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:amazon_clone_frontend/constants/error_handling.dart';
import 'package:amazon_clone_frontend/constants/global_variables.dart';
import 'package:amazon_clone_frontend/constants/utils.dart';
import 'package:amazon_clone_frontend/models/product_model.dart';
import 'package:amazon_clone_frontend/providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminServices {
  void sellProducts(
      {required BuildContext context,
      required String name,
      required String description,
      required String category,
      required double price,
      required double quantity,
      required List<File> images,
        required VoidCallback onSuccess
      }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false).user;
    try {
      final cloudinary = CloudinaryPublic("dv37h8ukm", "amkxlyw1");
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary
            .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));
        imageUrls.add(res.secureUrl);
      }

      ProductModel productData = ProductModel(
          name: name,
          description: description,
          category: category,
          quantity: quantity,
          price: price,
          images: imageUrls);

      http.Response res =
          await http.post(Uri.parse('$apiPath/admin/add-products'),
              headers: {
                'Content-Type': 'application/json; charset=utf-8',
                "x-auth-token": userProvider.token
              },
              body: productData.toJson());

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Product Added Successfully!");
            Navigator.of(context).pop();
            onSuccess();
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  Future<List<ProductModel>> fetchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false).user;
    List<ProductModel> productList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$apiPath/admin/get-products'), headers: {
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

  void deleteProduct(
      {required BuildContext context,
      required ProductModel productModel,
      required VoidCallback onSuccess}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false).user;
    try {

      http.Response res =
      await http.post(Uri.parse('$apiPath/admin/delete-products'),
          headers: {
            'Content-Type': 'application/json; charset=utf-8',
            "x-auth-token": userProvider.token
          },
          body: jsonEncode({
            "id":productModel.id
          })
      );

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            onSuccess();
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
