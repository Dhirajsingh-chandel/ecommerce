import 'dart:developer';

import 'package:ecommerce/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/cart_model.dart';

class CartProvider extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  double _totalPrice = 0;

  double get totalPrice => _totalPrice;

  DBHelper db = DBHelper();

  late Future<List<CartModel>> _cartModel;
  Future<List<CartModel>> get cartModel => _cartModel;


  Future<List<CartModel>> getData()async{
    var dbClient = await db.database;
    _cartModel = db.getCartList();
    dbClient!.query('cart').then((value){
      log(value.toString());
      log("table data");
    });
    return _cartModel;
  }

  void _setPrefItem() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('cart_item', _counter);
    preferences.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getPrefItem() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _counter = preferences.getInt('cart_item') ?? 0;
    _totalPrice = preferences.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }

  void addCount() {
    _counter++;
    _setPrefItem();
    notifyListeners();
  }

  void removeCount() {
    _counter--;
    _setPrefItem();
    notifyListeners();
  }

  int getCount() {
    _getPrefItem();
    return _counter;
  }


  void addTotalPrice(double productPrice) {
    _totalPrice  = _totalPrice + productPrice;
    _setPrefItem();
    notifyListeners();
  }

  void removeTotalPrice(double productPrice) {
    _totalPrice  = _totalPrice - productPrice;
    _setPrefItem();
    notifyListeners();
  }

  double getTotalPrice() {
    _getPrefItem();
    return _totalPrice;
  }


}
