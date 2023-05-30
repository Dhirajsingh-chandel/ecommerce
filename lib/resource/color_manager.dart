import 'package:flutter/material.dart';


class ColorManager{

  static Color primary  = HexColor.fromHex("#33C8FF");
  static Color black  = HexColor.fromHex("#0d0d0d");
  static Color slashColor   = HexColor.fromHex("#ff9966");
  static Color darkGrey  = HexColor.fromHex("#7c7c7b");
  static Color grey1  = HexColor.fromHex("#f8f5f0");
  static Color grey  = HexColor.fromHex("#777675");
  static Color blue  = HexColor.fromHex("#0047AB");
  static Color lightGrey  = HexColor.fromHex("#c4c3c3");
  static Color white  = HexColor.fromHex("#ffffff");
  static Color  error  = HexColor.fromHex("#FF0000");
  static Color logoColor  = HexColor.fromHex("#ff9966");
  static const buttonColor = Color(0xffFF5A20);
}

extension HexColor on Color{
  static Color fromHex(String hexColorString){
    hexColorString = hexColorString.replaceAll("#", "");
    if(hexColorString.length == 6){
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return  Color(int.parse(hexColorString, radix: 16));
  }
}