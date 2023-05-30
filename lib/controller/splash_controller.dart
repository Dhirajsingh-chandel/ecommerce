import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../resource/route_manager/route_manager.dart';

class SplashProvider extends ChangeNotifier {

  goToHomePage(context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushNamedAndRemoveUntil(
            context, Routes.categoryListPage, (route) => false));

  }
}
