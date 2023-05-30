import 'dart:convert';
import 'dart:developer';
import 'package:ecommerce/view/category_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../api_services/api_const.dart';
import '../api_services/api_request.dart';
import '../model/category_model.dart';

class CategoryProvider extends ChangeNotifier {
  List _categoryList = [];

  List get categorysList => _categoryList;

  String? image;

  fetchImage(){
    imageList.forEach((element) {
      image = element.toString();
    });
    notifyListeners();
    return image;
  }



  void fetchCarDetails(context) async {

    try {
      final response = await ApiRequest.getApiCall(AppUrl.productCategory);
      // Process the response data
      List<dynamic> jsonData = response;
       _categoryList = jsonData;
      log("------------------------------------------");
      log("${_categoryList.toString()} ------");
    } catch (e) {
      // Handle API call error or internet connectivity error

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
