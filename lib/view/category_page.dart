import 'dart:developer';
import 'package:ecommerce/controller/category_provider.dart';
import 'package:ecommerce/view/product_list_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../resource/color_manager.dart';
import '../resource/route_manager/route_manager.dart';
import '../resource/string_manager.dart';
import '../resource/style_manager.dart';
import '../resource/value_manager.dart';
import '../resource/widget.dart';
import '../resource/widget/card.dart';

List<String> imageList = [
  'https://img1.exportersindia.com/product_images/bc-full/dir_8/223743/fancy-jewellery-items-1720613.jpg'
      'https://img1.exportersindia.com/product_images/bc-full/dir_8/223743/fancy-jewellery-items-1720613.jpg'
      'https://img1.exportersindia.com/product_images/bc-full/dir_8/223743/fancy-jewellery-items-1720613.jpg'
      'https://img1.exportersindia.com/product_images/bc-full/dir_8/223743/fancy-jewellery-items-1720613.jpg'
];

class ProductCategoryPage extends StatelessWidget {
  const ProductCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final categoryProvider =
        Provider.of<CategoryProvider>(context, listen: false);
    categoryProvider.fetchCarDetails(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppString.product,
            style: getMediumStyle(
                color: ColorManager.white, fontSize: AppSize.s18)),
      ),
      body: Consumer<CategoryProvider>(
        builder: (context, categoryListProvider, child) {
          return Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Expanded(
                child: categoryProvider.categorysList.isNotEmpty
                    ? Column(
                        children: [
                          GridView.count(
                              shrinkWrap: true,
                              crossAxisCount: 3,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 8.0,
                              children: categoryProvider.categorysList.map((e) {
                                return Center(
                                  child: GestureDetector(
                                    onTap: (){
                                      log(e);
                                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  ProductListPage(itemName: e.toString())));
                                    },
                                    child: Container(
                                        height: size.height * 0.20,
                                        width: size.width * 0.30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: ColorManager.black)),
                                        child: Center(
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: size.height * 0.02,
                                              ),
                                              const Center(
                                                  child:
                                                      Text("Image....")),
                                              SizedBox(
                                                height: size.height * 0.07,
                                              ),
                                              Text("$e"),
                                            ],
                                          ),
                                        )),
                                  ),
                                );
                              }).toList()),
                        ],
                      )

                    /*ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: categoryListProvider.categorysList.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.productListPage);
                                },
                                child: ReusableCard(
                                  width: size.width * 0.75,
                                  height: size.height * 0.30,
                                  title:
                                      'Location Name : ${categoryListProvider.categorysList[index]}',
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                            ],
                          );
                        },
                      )*/
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              )
            ],
          );
        },
      ),
    );
  }
}

class ImageList extends StatelessWidget {
  const ImageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
          children: imageList.map((e) {
        return Image(image: NetworkImage(e));
      }).toList()),
    );
  }
}
