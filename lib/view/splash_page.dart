import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/splash_controller.dart';
import '../resource/string_manager.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final splashProvider = Provider.of<SplashProvider>(context,listen: false);
    splashProvider.goToHomePage(context);
    return const Scaffold(
      body: Center(
        child: Text(AppString.splashMsg),
      ),
    );
  }
}
