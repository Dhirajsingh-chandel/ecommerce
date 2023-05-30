import 'dart:developer';

import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/resource/string_manager.dart';
import 'package:ecommerce/resource/style_manager.dart';
import 'package:ecommerce/view/product_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/cart_provider.dart';
import '../db_helper.dart';
import '../resource/color_manager.dart';
import '../resource/route_manager/route_manager.dart';
import '../resource/value_manager.dart';
import 'package:badges/badges.dart' as badges;

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.appCart,
            style:
                getBoldStyle(color: ColorManager.white, fontSize: AppSize.s18)),
        actions: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.cartPage);
              },
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Consumer<CartProvider>(
                    builder: (context, value, child) {
                      return badges.Badge(
                        badgeContent: Text(value.getCount().toString()),
                        child: const Icon(Icons.shopping_cart_outlined),
                      );
                    },
                  )),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: cartProvider.getData(),
            builder: (context, AsyncSnapshot<List<CartModel>> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height*0.20,
                      ),
                       Image(
                        image: const AssetImage('assets/Images/empty_cart.png'),
                        height: size.height*0.20,
                        width: size.width*0.60,
                      ),
                      Text("Your Cart Is Empty", style: getBoldStyle(color: ColorManager.black , fontSize: AppSize.s28),)
                    ],
                  ));
                } else {
                  return Expanded(
                      child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            margin: const EdgeInsets.only(right: 10, left: 10),
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Image.network(
                                    snapshot.data![index].image.toString(),
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(
                                          Icons.image_search_outlined);
                                    },
                                  ),
                                  title: Text(
                                      snapshot.data![index].productName
                                          .toString(),
                                      style: getMediumStyle(
                                          color: ColorManager.black,
                                          fontSize: AppSize.s16)),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Rs : ${snapshot.data![index].initialPrice.toString()}",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.6)),
                                    ),
                                  ),
                                ),
                                ButtonBar(
                                  alignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    /*Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "Qty :-  ${snapshot.data![index].quantity.toString()}"),
                                    ),*/
                                    Container(
                                      height: size.height * 0.06,
                                      width: size.width * 0.35,
                                      decoration: BoxDecoration(
                                        color: ColorManager.primary,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.add,
                                                color: ColorManager.white),
                                            onPressed: () {
                                              int quantity = snapshot
                                                  .data![index].quantity!
                                                  .toInt();
                                              double price = snapshot
                                                  .data![index].productPrice!
                                                  .toDouble();
                                              quantity++;
                                              double? newPrice =
                                                  price * quantity;

                                              dbHelper!
                                                  .updateQuantity(CartModel(
                                                id: snapshot.data![index].id,
                                                productId: snapshot
                                                    .data![index].productId,
                                                productName: snapshot
                                                    .data![index].productName,
                                                initialPrice: snapshot
                                                    .data![index].initialPrice,
                                                productPrice: newPrice,
                                                quantity: quantity,
                                                image:
                                                    snapshot.data![index].image,
                                              ))
                                                  .then((value) {
                                                newPrice = 0;
                                                quantity = 0;
                                                cartProvider.addTotalPrice(
                                                    double.parse(snapshot
                                                        .data![index]
                                                        .initialPrice
                                                        .toString()));
                                                log("update done");
                                              }).onError((error, stackTrace) {
                                                log("update error");
                                              });
                                            },
                                          ),
                                          Text(snapshot.data![index].quantity
                                              .toString()),
                                          IconButton(
                                            icon: Icon(Icons.remove,
                                                color: ColorManager.white),
                                            onPressed: () {
                                              int quantity = snapshot
                                                  .data![index].quantity!
                                                  .toInt();
                                              double price = snapshot
                                                  .data![index].productPrice!
                                                  .toDouble();
                                              quantity--;
                                              double? newPrice =
                                                  price * quantity;

                                              if (quantity > 0) {
                                                dbHelper!
                                                    .updateQuantity(CartModel(
                                                  id: snapshot.data![index].id,
                                                  productId: snapshot
                                                      .data![index].productId,
                                                  productName: snapshot
                                                      .data![index].productName,
                                                  initialPrice: snapshot
                                                      .data![index]
                                                      .initialPrice,
                                                  productPrice: newPrice,
                                                  quantity: quantity,
                                                  image: snapshot
                                                      .data![index].image,
                                                ))
                                                    .then((value) {
                                                  newPrice = 0;
                                                  quantity = 0;
                                                  cartProvider.removeTotalPrice(
                                                      double.parse(snapshot
                                                          .data![index]
                                                          .initialPrice
                                                          .toString()));
                                                  log("update done");
                                                }).onError((error, stackTrace) {
                                                  log("update error");
                                                });
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete_forever,
                                          size: AppSize.s35),
                                      onPressed: () {
                                        dbHelper!.delete(
                                            snapshot.data![index].id!.toInt());
                                        cartProvider.removeCount();
                                        cartProvider.removeTotalPrice(
                                            double.parse(snapshot
                                                .data![index].productPrice
                                                .toString()));
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ));
                }
              }
              return const Text("");
            },
          )
        ],
      ),
      bottomSheet: Consumer<CartProvider>(
        builder: (context, value, child) {
          return Visibility(
            visible: value.getTotalPrice().toStringAsFixed(2) == '0.00'
                ? false
                : true,
            child: Container(
              height: size.height * 0.10,
              decoration: BoxDecoration(color: ColorManager.grey),
              child: PriceBar(
                title: 'Sub Total ',
                value: 'Rs. ${value.getTotalPrice().toStringAsFixed(2)}',
              ),
            ),
          );
        },
      ),
    );
  }
}
