import 'package:ecommerce/controller/cart_provider.dart';
import 'package:ecommerce/controller/product_list_provider.dart';
import 'package:ecommerce/resource/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/category_provider.dart';
import 'controller/splash_controller.dart';
import 'resource/route_manager/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => CategoryProvider()),
      ChangeNotifierProvider(create: (context) => SplashProvider()),
      ChangeNotifierProvider(create: (context) => ProductListProvider()),
      ChangeNotifierProvider(create: (context) => CartProvider())
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        onGenerateRoute: RoutesGenerator.getRoute,
        initialRoute: Routes.splashPage,
      ),
    );
  }
}