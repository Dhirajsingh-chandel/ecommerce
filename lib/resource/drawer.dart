import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'font_manager.dart';
import 'route_manager/route_manager.dart';
import 'style_manager.dart';
import 'value_manager.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: DrawerHeader(
              child: Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  /*image: DecorationImage(
                    image: AssetImage(ImageAssets.logo),
                    //fit: BoxFit.cover,
                  ),*/
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home_outlined,
              color: ColorManager.black,
              size: AppSize.s28,
            ),
            title: Text("Page 1",
                style: getSemiBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s16)),
            onTap: () {
              Navigator.pushNamed(context, Routes.carListPage);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.home_outlined,
              color: ColorManager.black,
              size: AppSize.s28,
            ),
            title: Text("Page 2",
                style: getSemiBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s16)),
            onTap: () {
              Navigator.pushNamed(context, Routes.carListPage);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.home_outlined,
              color: ColorManager.black,
              size: AppSize.s28,
            ),
            title: Text("Page 3",
                style: getSemiBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s16)),
            onTap: () {
              Navigator.pushNamed(context, Routes.carListPage);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.home_outlined,
              color: ColorManager.black,
              size: AppSize.s28,
            ),
            title: Text("Page 4",
                style: getSemiBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s16)),
            onTap: () {
              Navigator.pushNamed(context, Routes.carListPage);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.home_outlined,
              color: ColorManager.black,
              size: AppSize.s28,
            ),
            title: Text("Page 5",
                style: getSemiBoldStyle(
                    color: ColorManager.black, fontSize: FontSize.s16)),
            onTap: () {
              Navigator.pushNamed(context, Routes.carListPage);
            },
          ),
        ],
      ),
    );
  }
}
