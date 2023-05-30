import 'package:ecommerce/view/cart_page.dart';
import 'package:ecommerce/view/product_list_page.dart';
import 'package:flutter/material.dart';
import '../../view/category_page.dart';
import '../../view/splash_page.dart';
import '../string_manager.dart';


final navKey = GlobalKey<NavigatorState>();


class Routes {
  static const String splashPage = "/splashPage";
  static const String categoryListPage = "/categoryListPage";
  static const String productListPage = "/productListPage";
  static const String cartPage = "/cartPage";
}


class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Routes.categoryListPage:
        return MaterialPageRoute(builder: (_) => const ProductCategoryPage());
      case Routes.productListPage:
        return MaterialPageRoute(builder: (_) =>   ProductListPage());
      case Routes.cartPage:
        return MaterialPageRoute(builder: (_) =>   CartPage());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppString.noRouteFound),
              ),
              body: const Center(
                child: Text(AppString.noRouteFound),
              ),
            ));
  }
}
