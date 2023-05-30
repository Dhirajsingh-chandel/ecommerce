// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

List<String> categoryModelFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String categoryModelToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));

class CategoryModel {
  final String? electronics;
  final String? jewelery;
  final String? menClothing;
  final String? womenClothing;

  CategoryModel({
    this.electronics,
    this.jewelery,
    this.menClothing,
    this.womenClothing,
  });
}

class CategoryListModel {
  final List<CategoryModel> items;

  CategoryListModel({
    required this.items,
  });
}
