import 'dart:convert';
import 'dart:developer';
import 'package:ecommerce/model/product_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../api_services/api_const.dart';
import '../api_services/api_request.dart';
import '../model/category_model.dart';

class ProductListProvider extends ChangeNotifier {
  List<ProductListModel> _productList = [];

  List<ProductListModel> get productsList => _productList;

  void fetchProductList(context , String item) async {
    try {
      final response = await ApiRequest.getApiCall("${AppUrl.productList}/$item");
      final List<dynamic> jsonData = response;
     _productList = jsonData.map((json) => ProductListModel.fromJson(json)).toList();
      log("------------------------------------------");
      log("${response.toString()} ------");
      log("${_productList[0].title.toString()} ------");
    } catch (e) {
      log(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      if (kDebugMode) {
        print(e.toString());
      }
    }
    notifyListeners();
  }
}
