import 'dart:developer';
import 'package:ecommerce/controller/cart_provider.dart';
import 'package:ecommerce/controller/product_list_provider.dart';
import 'package:ecommerce/db_helper.dart';
import 'package:ecommerce/model/cart_model.dart';
import 'package:ecommerce/resource/color_manager.dart';
import 'package:ecommerce/resource/style_manager.dart';
import 'package:ecommerce/resource/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../resource/route_manager/route_manager.dart';
import '../resource/string_manager.dart';
import 'package:badges/badges.dart' as badges;

class ProductListPage extends StatelessWidget {
  final String? itemName;

  ProductListPage({
    Key? key,
    this.itemName,
  }) : super(key: key);

  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    final productListProvider =
        Provider.of<ProductListProvider>(context, listen: false);
    productListProvider.fetchProductList(context, itemName.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.items,
            style: getMediumStyle(
                color: ColorManager.white, fontSize: AppSize.s18)),
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
      body: Consumer<ProductListProvider>(
          builder: (context, itemListProvider, child) {
        return Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Expanded(
              child: itemListProvider.productsList.isNotEmpty
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: itemListProvider.productsList.length,
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
                              margin:
                                  const EdgeInsets.only(right: 10, left: 10),
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Image.network(
                                      itemListProvider.productsList[index].image
                                          .toString(),
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(
                                            Icons.image_search_outlined);
                                      },
                                    ),
                                    title: Text(
                                        itemListProvider
                                            .productsList[index].title
                                            .toString(),
                                        style: getMediumStyle(
                                            color: ColorManager.black,
                                            fontSize: AppSize.s16)),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "Rs : ${itemListProvider.productsList[index].price.toString()}",
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.6)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.all(05.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(AppString.rating,
                                              style: getLightStyle(
                                                  color: ColorManager.black,
                                                  fontSize: AppSize.s14)),
                                          RatingBar.builder(
                                            itemSize: 20,
                                            ignoreGestures: true,
                                            initialRating: itemListProvider
                                                .productsList[index]
                                                .rating!
                                                .rate!
                                                .toDouble(),
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 4.0),
                                            itemBuilder: (context, _) {
                                              return const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              );
                                            },
                                            onRatingUpdate: (rating) {},
                                          ),
                                        ],
                                      )),
                                  ButtonBar(
                                    alignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            "Category :- ${itemListProvider.productsList[index].category.toString().split('.')[1]}"),
                                      ),
                                      ElevatedButton(
                                        child: const Text(AppString.addToCart),
                                        onPressed: () {
                                          dbHelper!
                                              .insert(CartModel(
                                                  id: int.parse(itemListProvider
                                                      .productsList[index].id
                                                      .toString()),
                                                  productId: itemListProvider
                                                      .productsList[index].id
                                                      .toString(),
                                                  productName: itemListProvider
                                                      .productsList[index].title
                                                      .toString(),
                                                  initialPrice: double.parse(
                                                      itemListProvider
                                                          .productsList[index]
                                                          .price
                                                          .toString()),
                                                  productPrice: double.parse(
                                                      itemListProvider.productsList[index].price.toString()),
                                                  quantity: 1,
                                                  image: itemListProvider.productsList[index].image.toString()))
                                              .then((value) {
                                            log(value.productName.toString());
                                            log("Hello add to cart");

                                            cartProvider.addTotalPrice(
                                                double.parse(itemListProvider
                                                    .productsList[index].price
                                                    .toString()));
                                            cartProvider.addCount();
                                          }).onError((error, stackTrace) {
                                            log(error.toString());
                                          });
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
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
          ],
        );
      }),
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

class PriceBar extends StatelessWidget {
  final String title, value;

  const PriceBar({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
